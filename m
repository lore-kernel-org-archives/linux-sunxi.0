Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC05F19CCF3
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 10:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004098; cv=none; b=S0JXfZJQ+8y5fog94YCGysdq91vjSdF6O87y8DhxbqN1Fzm48mYDNAe9Li7e3YbJiOgH+2+jKjM9WwmXnCLKWolOEpoyuEnXScO+UkaBhgFT/VXmzL9TsljDtwE30kh02c0jB0cW9RbgwEImH9tyctPOTCMUdD6LxVh4D8qnnqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004098; c=relaxed/simple;
	bh=5CBZcY+hsCqjA7yd6DOVO1gJncK5nNvs1mJLn3kWbjo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=g49DrdZbqRlwlhUI/1+jM11h+tCZOG8g08apQOvMa+Hs10jv0lIdJveI938VJe0OULy1zLFXNQf/x3b2FUQyNRbSjJCm5XrNim3iKYlgwvhHnBl0He3ZYcNWP7Gd5qm/k+ZykVoReM1/ijtyyj9D+WthaTB94chuUDP0h8KVPYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KR5ogGoN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KR5ogGoN"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3678f36f154so577315f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Jul 2024 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720004094; x=1720608894; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2qm0K3jIFzcKInhy4SvJXxy1XVZ9MwLxLzY8rfv6AI=;
        b=KR5ogGoNoJiT9zVUIHVp+YFEcBY3mmnWawt2Wcuwv1SZAAX7D2qZrr+uRPfn4sJHr9
         FhXvGt6b034Cl6x1ZLYLeW33LEhUN5LsH1tOis0HVTOGngEM7MfxgT8J8vFjjOjzPpFX
         vIhUxH9T+iW4+OyaGj26jZx6FYPtD5596ocb/pzWY2KYpp8ttuoCp4WubFMpkyoEciPJ
         fIrMTqZduQrIJsnBNmb4moFO6O/iZMaMiBL/Hp/fVNu8YeTTjhJ5jJFX4ise9qXYxFyk
         p8iuG3nfqPTme0XQLQBIjIffnLuuk5ZHHDmSSKibs4U2hA9P6ttS/8wju1Is8FAzobLX
         iDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004094; x=1720608894;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q2qm0K3jIFzcKInhy4SvJXxy1XVZ9MwLxLzY8rfv6AI=;
        b=HomyY3GvpfEOvedvYtmhzGaGYj7Bwiy8vTO9QvwiARkLuFwvOkHZRlsZs7Uqm3rH+5
         wrdFB8PuMAM9BdZwXSc6NJI/qYt9vt2dOrYlZFbaJK9rrsVoz32E2FXNvjJWwBcvsCmE
         J2pPZX5s9P5izzLlpqIlVR1yHuS8IeMD0mDgtDUtrQaZeR+CALAjD9F8OW6+exZWBJOu
         WOZKH+U9C8bsPDuIGrQgVNqcmzyhotr4brtcIuxhVRxeeDBjCLvrjKo9dqMAF1weqlLr
         A7YPgUdTFTV5WZ2T5mm0QoLyQNtPaOxg6vCfno27eO9VOr+MkxdSp/Ykb/Ktkl7WvM1H
         5hmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRitp4cJSXAIrVMffNZydSNaq7J+M9BXEu4HRheP0aOzQf0eEOjz076zy1cTN6HKd/UaJgXAHCoz/dlVPgbTrYxzeCDz8piE0emAE=
X-Gm-Message-State: AOJu0Ywpoo3RCnavliQCXDI6dYc3Nox6kEApsNvaPMADHrXrdJ2Rx0QS
	Yv1ROUyjrom3JViOuhBT+oyQtUpNQQERQGpz5yjcQJO1xS+Zq++YkUz1UHozcoQ=
X-Google-Smtp-Source: AGHT+IFxj8jlEQLBpSqKhooeLWCX1htSQQ5imS6gMVsLRfICOATTre1xSXqKt543E2h6n9McHYRATQ==
X-Received: by 2002:a5d:4529:0:b0:362:1b7e:8e66 with SMTP id ffacd0b85a97d-36775730f03mr6861561f8f.71.1720004094166;
        Wed, 03 Jul 2024 03:54:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef03:73b5:7503:ee71? ([2a01:e0a:982:cbb0:ef03:73b5:7503:ee71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fbbfesm15660302f8f.66.2024.07.03.03.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 03:54:53 -0700 (PDT)
Message-ID: <40c995a4-ca34-47a8-b8d7-587c781527c1@linaro.org>
Date: Wed, 3 Jul 2024 12:54:52 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 05/10] clk: meson: s4: peripherals: Constify struct
 regmap_config
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
 <20240703-clk-const-regmap-v1-5-7d15a0671d6f@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240703-clk-const-regmap-v1-5-7d15a0671d6f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2024 11:50, Javier Carrasco wrote:
> `clkc_regmap_config` is not modified and can be declared as const to
>   move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>   drivers/clk/meson/s4-peripherals.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 130c50554290..ba1d531fce4f 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -3747,7 +3747,7 @@ static struct clk_regmap *const s4_periphs_clk_regmaps[] = {
>   	&s4_adc_extclk_in_gate,
>   };
>   
> -static struct regmap_config clkc_regmap_config = {
> +static const struct regmap_config clkc_regmap_config = {
>   	.reg_bits       = 32,
>   	.val_bits       = 32,
>   	.reg_stride     = 4,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
