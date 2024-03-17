Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C721C6A4
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 15:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710689828; cv=none; b=KX8PNt0V8jlBzPJ3d6sPZ/G7Gpj7iwTNno8L713Lq71mY2lxZQxNs6l+2WolsdV6503kJq1DNIdSDkHd9vhwas07+cEc4SsSGk8R60sDY/njSizsitxX6dGK7fhRrfbNaykOmv4pejTmhVAZxF3ctqN/KsdhESfrQ8mTkwJGIgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710689828; c=relaxed/simple;
	bh=mINZzG8MsiPOIqLtvTwJWSlmXsjd0rm5zc6iBGJqlvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QbnKyKHwYwTpvhB0lqaYnmR6HsLX+ZSNluonjz0S1NvAP2ZC7/Zv2xXWnDq4EebYW3J8dCY0pTVPmlPMO79u8V09XnIgjPB16aHRQjXxNhnUGIWniWN5X3uNeDwMG7uUVowaFu1WpdsQDEgc0luI1cy09aNvGrGa1IFcnYKnzr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTLApiSI; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTLApiSI"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513d9176cf9so2435067e87.1
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 08:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710689825; x=1711294625; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TUArIiut1cWPP+AwimO/LFgXs0A/dh0M6eE5ulhPRso=;
        b=cTLApiSIXzFHBgOYp3yFp6r0EeuT0C29CsQqquHVEtLqXvbu3+/xjrEWF6q9Xq0U8A
         ITdimp9scvJ0pmPhHSVCeLC7/+qGZBaNaaW9X97T0HNSlt5oajIFLvM74t/5s1jwE/uI
         gTkXMxLdYTi9/kYMeW9lR41ktXp5j25NLal0KeZoy6wNNrK94rvs6PcO+szpsASmUr3l
         lsftYlrD/XtFWmoIjG7Va2HTgYNbLfNBhUxipt1X8CehZvW8C9gzX4TrUgkZHeCbsvnN
         GERaClyKDO0It6GfQrn4b1GNRjMsq5wQ1tQhmZkvrWmSz6cGd1M0gYg8kJCTEZkSdgi0
         vBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710689825; x=1711294625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TUArIiut1cWPP+AwimO/LFgXs0A/dh0M6eE5ulhPRso=;
        b=VCGe2xHraWsVKnB0xvaR27XajpJmicAwxFq/dKIxR12Dclet/Oazo9EMN8H6ZvkZ0B
         iwhBlpssMDQ/e3eY827jpkPo3Am59Bk1LiyPr93zynx7RwLNDNeVWvBzfeEOsEwLEn09
         jqqtg6SvRlkVsock5aEyBxhUQlDqY8deST5TtZcKwFlMhMpti3cK2xDosO0nU2asyT59
         lKgkTfQDFQDnSXiEPDMg2yrROtQeaXjidpYoffUJXHKRm7WFWoRa6v6Kz7hmE+QSXhn4
         VL+YDhDcQm3wRhdj8Qb4GkAlgWDlnv72wPYAFWdOr0E4SdL8wxjDEMb0iDvKfnuHDb9O
         suGw==
X-Forwarded-Encrypted: i=1; AJvYcCW0xyNoy8pXcGBdIX4KNhfxXQ93KYy/1Fbr7tJ+ooVNX0gtiLL5LAhrsiEIBzeDMz4wGCx5C2+cYofdlOZsnsXmX49nKRfmQuxK8Tk=
X-Gm-Message-State: AOJu0YwWgV+W1WtwzhO4S9GIOuQN9f3ouWalsvjg7G9Z/VrIwBo7Qc67
	InNn4LQgt59bMMy4I3d4cn4mBimZGsCb6Cp1GioAeAUknzTLObsm
X-Google-Smtp-Source: AGHT+IE8iVEBLsbeBWUw0aacjQEV/qt7NW/hXDIvCewyz3XIiPcSWcGo7/r3YlriRP4Z0ignZ10RzQ==
X-Received: by 2002:a05:6512:3283:b0:513:c97c:d5f with SMTP id p3-20020a056512328300b00513c97c0d5fmr5528365lfe.12.1710689824967;
        Sun, 17 Mar 2024 08:37:04 -0700 (PDT)
Received: from [192.168.100.117] (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id t10-20020a1709064f0a00b00a46b6a8fc25sm762569eju.64.2024.03.17.08.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Mar 2024 08:37:04 -0700 (PDT)
Message-ID: <f4f02cb2-6263-4bd4-a798-c92c31f7b363@gmail.com>
Date: Sun, 17 Mar 2024 16:36:50 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: h616: add support for T95
 tv boxes
Content-Language: pl
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20240317-add-t95-axp313-support-v2-0-e38032811758@gmail.com>
 <20240317-add-t95-axp313-support-v2-3-e38032811758@gmail.com>
 <1860c559-5a5c-4673-9d08-253f0945762b@linaro.org>
From: Kamil Kasperski <ressetkk@gmail.com>
In-Reply-To: <1860c559-5a5c-4673-9d08-253f0945762b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

W dniu 17.03.2024 o 15:57, Krzysztof Kozlowski pisze:
> On 17/03/2024 02:34, Kamil Kasperski wrote:
>> Add dtsi file for T95 tv boxes and add initial
>> support for T95 5G AXP313A variant with a board name
>> H616-T95MAX-AXP313A-v3.0
>>
>> internal NAND chip is connected to NAND controller
>> I can't see any nand in sun50i-h616.dtsi, so access to
>> internal memory is not implemented.
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>
>> Signed-off-by: Kamil Kasperski <ressetkk@gmail.com>
>> ---
>>  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>>  arch/arm64/boot/dts/allwinner/sun50i-h616-t95.dtsi | 109 +++++++++++++++++++++
>>  .../dts/allwinner/sun50i-h616-t95max-axp313.dts    |  85 ++++++++++++++++
>>  3 files changed, 195 insertions(+)
>>
>> +
>> +	reg_vcc3v3: vcc3v3 {
>> +		/* discrete 3.3V regulator */
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vcc-3v3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	wifi_pwrseq: wifi_pwrseq {
> No underscores in node names. From where did you copy this code?

arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts#L44
Seems this one needs a fixup.

>> +		compatible = "mmc-pwrseq-simple";
>> +		clocks = <&rtc CLK_OSC32K_FANOUT>;
>> +		clock-names = "ext_clock";
>> +		pinctrl-0 = <&x32clk_fanout_pin>;
>> +		pinctrl-names = "default";
>> +		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
>> +	};
>> +};
>> +
>
> Best regards,
> Krzysztof
>

