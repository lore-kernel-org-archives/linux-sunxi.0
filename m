Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782DF2B9B9
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Nov 2025 14:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762612706; cv=none; b=IzZBVQA7JFlPj3LKaLorkyPN4nNNSOkWBLWZlPlSed8OJEd+ACG3kcxt8OZGQnJgcKOBrfIylfaT5vsbn3Lkivrju2XjjQak+YoNGJARCaXMkfAyDotvxf02syYlOG9nS772B10n5SlNu1OsQa63Qq81F+aHxGsxgWNkLTHMa6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762612706; c=relaxed/simple;
	bh=cvwRyGoCNZb0l5Vkp0pBpQx4b8i+JQ5q1UuAHIXap0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VdKfkRWHeqye74gEB/pm5p5UnuTO94KcB3c/1TmMhyDhxcapDdvIK2/k1VGAM5cyGoAXNg2LUlkFFzj/8zo4ds2OwuAREy2InYszaw2+rD+4/V5sCPrTkS3iTZKZbeHxDxzZHgrJDyavpsX5hB0cFlDEKrmMTn+En+2CplYUoEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ct2NTOS6; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ct2NTOS6"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b30bf0feaso41003f8f.1
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Nov 2025 06:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762612702; x=1763217502; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CjskvN6jH7m+Duu1eq+hr6O2GRgMWF9LB47syyf4F5w=;
        b=ct2NTOS6En/Mk8peArRqwleZ85IalwpT1LiCXY+eni961arBrV9iarOOPjxd14x0d0
         ZsAgn98BwuiGPMPCimp41GaOgMT9QzRivWX8mzSm6gEM4YpzkpmYW0+UXeuZG3jovK6x
         rS3aZmul+VIu+DRoTwqHV0DxUaS4p5tUQPDqyS1HiNGd6KBsWjjfZL+fRrc5vAbvjj+4
         bLduhjDSyAXKhcMOTIHke8sv76ZsElfZuxLuewJ9s+b56k5pwM7KqNeugPXVXz8Jc/G1
         SaUoSxonYrzpWf8ev2tTurdAkD4nuDXG7sRU3vjwpGioRWoJm3Ts3675ZE+g80Vj7Qu9
         QHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762612702; x=1763217502;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjskvN6jH7m+Duu1eq+hr6O2GRgMWF9LB47syyf4F5w=;
        b=nGjKdRKZ5tfxS0ZZPwjd5jgak+F7PUe18++qAWfDY6KApXxv0Fan7qEgle2zdiyS4o
         z/yYXV6t3x8mZO8aKMnKZOdTB7bMmvy5+F9jkd/+FhmAeusFWS9Xvyu6YB/m0kymoO29
         dzHPNRufEYqn+HJBXUaKr5+c9v5MfxnaTzpmvggzaAcZrwNVAh0LS7bgIgjoExrtVW/F
         EvRNFsqMVaPLabvm965m/x3rVWGmZzb8h32xJ+rpDBh/nqapYZYjvdlUkhGZKaEjs2DL
         nq1AHJD3xIGdxn7SXboCGU7gCR5qA0FLv8FCXZO+nwSaf58M2LEvm1aLdJpzWVu20A5f
         rVhA==
X-Forwarded-Encrypted: i=1; AJvYcCXTsyxMhiFekVOUw3yNxX43R0KWFiRr66ZmIDtr9mYaXNPfDUxDRb0AtigqMn3YexH0i/um3yao3hLw1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcP3DpBaJTzCN6DAlvL7uwCCP0ZjzUO27QIQhTabqhfflHPe6K
	sNphUz5C2IZxSA9uTUXA2BA851qXQydbIfz60uS4dPkt1lxZs8kSKqU7Lw5nFYl8E5g=
X-Gm-Gg: ASbGncsV6RH97r9GvCgtlbcBEj/CUadxXhJDaz11GgfEipABGZuuHa8Pu4z8utnfQSz
	EQgxSQrPjgtq5wtsZy2nEG3Aqu6gX4/Tgvsi36pjLSIZYxigs+Cs6YXBdd7XKeWKIMPxTyx+Yd0
	ZgoUi3bLXQk25wUsTfBEaXSNLTmVOd7+Uj4ergi6wYSrjS5nWtioqNw3LvtKBBiZ6I49vFw05Ll
	n70rU9cNJuA47Htacws6IFd5EE2IGb5D8UCLL7ZreXB8nNwt7f2HFnq2EOmc8RfMgC7NBDJJbKm
	aViQkYrkqW1CUKKkkoseXY2pCk7If+pWu3Pw8wT47csIVpybb+D1tgMacq6GuDtUzGEA1X7GUcp
	rH9vX3NU84y9/mXog4L6ZbRCjENCKsbym4WHXJDR2wPMmp6duJ3rbySWHIGGzAsoM1hiN4nHGd1
	raw+Z47+gA9G2SPu5c5r4ka15rQ7Ffux8=
X-Google-Smtp-Source: AGHT+IFiBiRhpsly3YGEqjvxj+Py3Q4DK+JCa0siSF6z5aJmBhaLltU7plhNOwZpv/U5i5Vxxf3qew==
X-Received: by 2002:a05:600c:4ed1:b0:477:bb0:5e13 with SMTP id 5b1f17b1804b1-477732aa00amr11266585e9.8.1762612701759;
        Sat, 08 Nov 2025 06:38:21 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776a278a32sm56562505e9.12.2025.11.08.06.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Nov 2025 06:38:20 -0800 (PST)
Message-ID: <07cbc020-ece3-4483-b078-c265e3400d2b@linaro.org>
Date: Sat, 8 Nov 2025 15:38:18 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] cpufreq: ti: Simplify with
 of_machine_device_match()
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-5-d780ea1780c2@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-5-d780ea1780c2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2025 20:07, Krzysztof Kozlowski wrote:
>  static int ti_cpufreq_probe(struct platform_device *pdev)
>  {
>  	u32 version[VERSION_COUNT];
> @@ -564,8 +554,7 @@ static int __init ti_cpufreq_init(void)
>  	const struct of_device_id *match;
>  
>  	/* Check to ensure we are on a compatible platform */
> -	match = ti_cpufreq_match_node();
> -	if (match)
> +	if (of_machine_device_match(ti_cpufreq_of_match))
>  		platform_device_register_data(NULL, "ti-cpufreq", -1, match,
>  					      sizeof(*match));

This is obviously wrong patch... weird my W=1 builds did not flag it.

Best regards,
Krzysztof
