Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C824414F9ED
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jul 2024 10:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004072; cv=none; b=u0KLBecpuSNYchHUA3s9J3CI+zGxjcBdDoS4FdfDrj6AcZ4GU0gJuGFHN2nGrEBdBvIDw9gvb1mD3R2UgGZ07yJlU5ACLeqxmgluYat9WCyTnwo7QEf5Hc0DOgzAEYQUGsqWawb4m1EeE0AiOrkL/kzPAxPy7qdUAF8wYHa6BZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004072; c=relaxed/simple;
	bh=I/GpiHkKyV3BTuoiY5xI07I/ghOqMqti1L8LlNhnjHk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sfz7b2NnWIcx8XEjATuXC33X9UOYJ6KJeozqQwsV36HMBTlQ5PKdeKYc0uEJ0W5Wjbroyzdj5WCDPKXk/ecuuzc5TkX4koIhIvZZmBdeKDo7DEKa9Pvj2PS78IkXTj215jAjJ3SoeF6Zm0qyE6iwnDAgmur/rl63wtZgzvuZBDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T+hgR4wU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T+hgR4wU"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-366df217347so2928905f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 03 Jul 2024 03:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720004069; x=1720608869; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=po7h5jyYg7hwETO6R9fEgslkMlPrxWStSZ0gtZEh01Y=;
        b=T+hgR4wUFmhtifi91FY2Zq2WdVykGyXhAWYq/ws0hV1fDqtCYiHaZUH7auHG9MY7DP
         R5VjZssj/UzFaqc9IhmVSrjMvw9syW5Y9muIVqYXU8fj+jW6T1YoGZU3+EEMLYvn9ABC
         t20HAe2UY2YCnU1bXXE4UpDhEiwtK5mEP2wGHRy7XcYfAJWFsG2A+wI5HdLLf+XM7UDn
         Prq0tFH+whYwik89j/aCYhQuv+NX6oMOkPlj/mfeXf8A+UqrJ8zVT5RM6dBzxA7mjkO8
         6YhUTdvrG7IDaNoHCuSH4U59AjVgbO14mAl7VLr2fdn4cMJG27ZZsQW+uDuxTpU2VrOa
         JNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004069; x=1720608869;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=po7h5jyYg7hwETO6R9fEgslkMlPrxWStSZ0gtZEh01Y=;
        b=gSZRKJp/+jnUedsbKgbSIqC++y3yZn50TEsx86X2ZaAMdBcza/+u/G3v2eEnWB/zmy
         d1mtbStMueu7UpVyVyu90u8liQtUvjqmv/YfegxN7kvzprH+f4LQcJ+sAMjn1kQ/mTzC
         tDFRsiu/WdCV0JwQKtq/7hwEH5fONiIQ1uKhaRLfVWpco+vJ6rHKrIFWtM20RpZ5j/eY
         2vnYjjFC4BGqv23laIOhm03/IZ38sYeedl3bnFAKUElAalJV0UXo6OuMwSY/EJXrn8z9
         w2xCzn7NIIijgimwYHeAVeMKwTsTel37NU6FhDmls9kjQraE0g/608x0kIHuEIJbrn/i
         4o8w==
X-Forwarded-Encrypted: i=1; AJvYcCWr4sRgckPELkSc2SBe6rPSaOWVxsOL8PGYXuXrSEi6nk4YcHUJDWjUv1wxvnHKTsYcJxWZ0/escklAzI2e8jLYqLi30krU2OlGFFU=
X-Gm-Message-State: AOJu0YxXhEkK6/ZX0iwXnyzis84q7sm9evXpAr5CcgxxaBAeYyv0MNlq
	uUQ9RnJAX8a7W5+HWJEKEwtGS03mzhptL9hh4KKKdA1w61FvbQgPkgYvFQnZD2Y=
X-Google-Smtp-Source: AGHT+IFMCkLGFvnP8HSPPqHrZs1or35FFjDvFpUWNEiNiN89WTN27PTcrYD99R4NsVRe24lUHiGeYQ==
X-Received: by 2002:adf:e947:0:b0:367:96bd:127e with SMTP id ffacd0b85a97d-36796bd12femr418667f8f.46.1720004069003;
        Wed, 03 Jul 2024 03:54:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef03:73b5:7503:ee71? ([2a01:e0a:982:cbb0:ef03:73b5:7503:ee71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fbbfesm15660302f8f.66.2024.07.03.03.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 03:54:28 -0700 (PDT)
Message-ID: <b604e36e-18a4-4d01-b896-a37cd9fc1317@linaro.org>
Date: Wed, 3 Jul 2024 12:54:27 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 01/10] clk: meson: a1: peripherals: Constify struct
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
 <20240703-clk-const-regmap-v1-1-7d15a0671d6f@gmail.com>
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
In-Reply-To: <20240703-clk-const-regmap-v1-1-7d15a0671d6f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2024 11:50, Javier Carrasco wrote:
> `a1_periphs_regmap_cfg` is not modified and can be declared as const to
> move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>   drivers/clk/meson/a1-peripherals.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
> index 99b5bc450446..728ad13924ad 100644
> --- a/drivers/clk/meson/a1-peripherals.c
> +++ b/drivers/clk/meson/a1-peripherals.c
> @@ -2183,7 +2183,7 @@ static struct clk_regmap *const a1_periphs_regmaps[] = {
>   	&dmc_sel2,
>   };
>   
> -static struct regmap_config a1_periphs_regmap_cfg = {
> +static const struct regmap_config a1_periphs_regmap_cfg = {
>   	.reg_bits   = 32,
>   	.val_bits   = 32,
>   	.reg_stride = 4,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
