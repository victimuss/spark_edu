import axios, { AxiosInstance, AxiosError } from "axios";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { Platform } from "react-native";
import { api } from "./api";

// Локальный бэкенд: для эмулятора Android 10.0.2.2 (или localhost с adb reverse)
const LOCAL_HOST = Platform.OS === "android" ? "10.0.2.2" : "localhost";
export const LOCAL_API_URL = `http://${LOCAL_HOST}:8000`;
export const PROD_API_URL = "https://api.spark-edu.ru";

// Релизный APK должен обращаться к публичному API. Адрес 10.0.2.2 доступен
// только Android-эмулятору и не работает на физических устройствах.
export const API_BASE_URL = PROD_API_URL;

const apiInstance: AxiosInstance = axios.create({
  baseURL: API_BASE_URL,
  timeout: 10000,
  headers: {
    "Content-Type": "application/json",
  },
});

apiInstance.interceptors.request.use(
  async (config) => {
    const access_token = await AsyncStorage.getItem("access_token");
    if (access_token) {
      config.headers.Authorization = `Bearer ${access_token}`;
    }
    return config;
  },
  (error) => Promise.reject(error)
);

apiInstance.interceptors.response.use(
  (response) => response,
  async (error: AxiosError & { config: any }) => {
    if (
      error.response?.status === 401 &&
      error.config &&
      !error.config._retry
    ) {
      error.config._retry = true;
      try {
        const refresh_token = await AsyncStorage.getItem("refresh_token");
        if (refresh_token) {
          // Use a raw axios call instead of 'api.post' to avoid infinite recursion
          const res = await axios.post(`${apiInstance.defaults.baseURL}/users/refresh`, {
            token: refresh_token,
          });
          const newAccessToken = res.data.access_token;
          await AsyncStorage.setItem("access_token", newAccessToken);
          error.config.headers["Authorization"] = `Bearer ${newAccessToken}`;
          return apiInstance(error.config);
        }
      } catch (err) {
        console.error("Не удалось обновить токен", err);
        // If refresh fails, we should probably logout or redirect to login
        await AsyncStorage.multiRemove(["access_token", "refresh_token"]);
      }
    }
    return Promise.reject(error);
  }
);

export default apiInstance;
