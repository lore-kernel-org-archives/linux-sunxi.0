Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1482919CD13
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Feb 2025 08:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739780035; cv=none; b=sPNG+vEfSa+sdLUz8ODZJQ2f5jKA9FpUmkIX4n/g1rCG1TFAOOVSURxg9TZxrhAZyl7JxjwwYFJw3P+oUcktDDi7iZNhbv3Ow5UG9n/sc1ppkYVjufVo8aTSXYjQ3C0oD7DNB7xoeEuagHWjYj2fbqbkQUFj87i4t58gwpRneHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739780035; c=relaxed/simple;
	bh=QozSNP8neCUurbs0daW9m3IirCFvksJs5+R34IzwLRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JiIdw3iu+C/dLQcO7gKfHK00fLd44WS3uVKDQNt2A7jUskfSGEY2zIrQewERP0jRY9Jk3LKrvQp6CViHbaz8wjGQKD1e1lu92TCjpJ/CMCnJ0xmsF+OsdlzIYW8qSTvqD4zQoo31+fheQpMIrDU292X9YjfLPe9xHb7UD1Hf5ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcxzmWVB; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcxzmWVB"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ded46f323fso5007228a12.1
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Feb 2025 00:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739780032; x=1740384832; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ed0dltqBzdC5HZEa2Ds04Fdf98U466s3nHyR/nqOJbA=;
        b=WcxzmWVBm5C1A0+vMqXX79qiwPugILdcEkG7ndrPa0mYfivbsP130Zw1aEtTHrMhb4
         vsPhDwqfJFvwv+kr3NS1qpPJfkOP5dx9ZvACrBuwbLo7xQm72b/YvFvU3WlwK/q9APCi
         Vtdv4iPKRh2BtUqRE4QkUvNz5EM6CAE9jORa0a1mb1Oaeex0zaXzERcMWr0FcB+MvaSc
         KoyilRYyvNyoG1G6MnWCd0A8SDDImRDV3y3B+h6Wn1X1na4KXVTs0hdie3V66ehI1hS+
         U1REjKhcnUQaYlfs5dBa73jSNNx4+MHUERd9A5ry83WNWrAGrqlPGIdPWTXxOseF+yiS
         ItmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739780032; x=1740384832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ed0dltqBzdC5HZEa2Ds04Fdf98U466s3nHyR/nqOJbA=;
        b=xKzt/XRtI66NkmawVu1Bb9Pj1nrDwbRZK52RNZ09Hyz9+oIzFu+QxMyb8sDozwZGNn
         N8ClyfmAyWEz6BvEU8rCLddJ/JtWqA46aLZOu0trcQHUiFVVT+IgYYdf8q2CoWCKPf8O
         iUdNw8SAIwOZQpqaESA2/5YtOkStIBni/3ZmCmzDlRrl/iBK3mBQotBE4RrakmqF9Ep/
         pKfIJyh1Fbq8GzZPzOFASKGTgG9dinl2VcgOopV6uYBCJIybi/DGdukyDlSmIrXK01ur
         z50W1AbKMhcE5xua/7oGPjsDSGL9+2UvHQ/c2MzYI7EKdhsAuCYVjgPE0/FMCJe0h6r4
         i3Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXV9F9XROxlKU2WbmKgW3nclire1Pd0rVQOjmXBKYoF0G7J2bsFi1zZRmfhEZT3BTYnvyjZPqfZiwUo0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzryNmMYbpHCBPyVbw+Pp9H5GgC6IZMHKrrCUcPDU34/rwLQ1qE
	L2poCI9hygfn9jhiGGlRPIHtL/72rqc4wYyLIlNSnn84Bys607EMJhNSzyvbDf4=
X-Gm-Gg: ASbGncu0Z7dsI5xwRZtdKxaEGa/30KixXKT3s8wPxIv+yuXnaNRF6jCjsuEwfjmrbE4
	r0kVr55jQbVitKN/bPvyftzKTfavLgNgM2IQbl0HK+S4z7wSrW421NQDAKl7wgoznOmmhurHqd4
	qNihrB3LV535SNDLnrNup9DD7nrcXtwm5ifehismg7Zvdtk7bDGpkacx0/hQDqmBgHrJjpzB9WT
	lyO/+KzYaC1nBcaAegYb85L58Oud+XjG3kG11xhGo37MpwtYKTKCyCxnOpY2hHi9yVHUFC4GRUN
	fVrMIOLabdf0KtzQH3hJR3yvCBbynX3YCnlSLx4NOm5X7O/cqO5ksb16SabuFct4UQ==
X-Google-Smtp-Source: AGHT+IH9hASZetg0pomp/3PLBU1jTDpvzjle4RrQcRZBFNibluAmBZRivSYjX4BTIAIbbRumPxxbPA==
X-Received: by 2002:a05:6402:2548:b0:5dc:8ed9:6bc3 with SMTP id 4fb4d7f45d1cf-5e036217ca2mr7647503a12.26.1739780032077;
        Mon, 17 Feb 2025 00:13:52 -0800 (PST)
Received: from [10.13.13.3] (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e53sm6846077a12.9.2025.02.17.00.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 00:13:51 -0800 (PST)
Message-ID: <603e7d61-71ab-4ec8-8c37-133dd9847aca@gmail.com>
Date: Mon, 17 Feb 2025 09:13:50 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: allwinner: rg35xx: Add GPIO backlight
 control
To: Ryan Walklin <ryan@testtoast.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-9-ryan@testtoast.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20250216092827.15444-9-ryan@testtoast.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested on RG355XX-H

Tested-by: Philippe Simons <simons.philippe@gmail.com>

On 16/02/2025 10:27, Ryan Walklin wrote:
> The LCD backlight for this device can be exposed as a simple GPIO-
> controlled device. It would be more accurately modelled using PWM to
> enable brightness control, however the PWM driver design for the H616 is
> not yet upstreamed.
>
> Add a GPIO backlight node to the DTS.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>   .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> index 388487d4720e2..29d1144fc3987 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -21,6 +21,12 @@ aliases {
>   		serial0 = &uart0;
>   	};
>   
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&pio 3 28 GPIO_ACTIVE_HIGH>; // PD28
> +		default-on;
> +	};
> +	
>   	battery: battery {
>   		compatible = "simple-battery";
>   		constant-charge-current-max-microamp = <1024000>;
