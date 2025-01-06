Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675821DF244
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jan 2025 19:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736193052; cv=none; b=CFztX0noB3Pji8XAxuvCIer0eEBpPfTgo98EEMj4XM/SIsqU8MfCaQCradnOVSO14gh2gSEV/5PwQBeiitXnlPf29kvl80THahMzMt2zpFLWQ2pRw2IkKDClZXkwzCewKWKzvGUmJWOfG7KDwQ4cy7sdaXFYuG89C8p4Fv1NH7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736193052; c=relaxed/simple;
	bh=GoAdSlQ53RsfhU1nVMs7hQ56NBJFi+aeYKbM9eWk0js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+n7bBpmkbhzmT/wiNvz1GFzqw/KAzLwG+Gd3zDP4c7hsie2kpK8nQXPLMap+Jz6vbejkygGyM6JY0s5sXHiETDlrq+rQK6Kf3eoHaymqtk5HlX/2SOoVKPXk6UerfQvhW/aI3I76KNa750uhYC0W7Qw1lKZYr6k9dFaDJxAP/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kf5bQURa; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kf5bQURa"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54026562221so15877024e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jan 2025 11:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736193048; x=1736797848; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qGMHgXg4FhW7JGenz3T6xLfvKVPDR9iVCkZIU7+YIF8=;
        b=kf5bQURangpG/Csbn1VHfdZsXTCufvwpDO7gq7fSvH/S6MzCf6SMZmYgaMJHKBYHNK
         36zlZrcDd7lAySQmZc4rlnOBmdiVTuyO0w34teLhoufa5jVE+Y5H7HgH2ofwANsOLLbD
         XAg7tTCowAlQVVatwJyPVJYTusadWX1vLjecF4xreA9w+TSe3TKHxV/hkjSGgRYHj87t
         RWCdnqtZnD55zEZYi7T2lytYjiQdjGQy95vY2t/xIf03aIwQkxL21S6X4lM2rDDTRP02
         C0DiGonA4x/+Hrkwp8+4N3uD1uS95WGWwd4QG/jYqc2X/X73oZ7QFoKfc5rGBRiZ2Wyi
         BMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736193048; x=1736797848;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGMHgXg4FhW7JGenz3T6xLfvKVPDR9iVCkZIU7+YIF8=;
        b=iJLc8FYTW3oy/mrH7GKs08Oy/XWlNW91drjEYoFx44EeI1Djth6BR2ic9D9Excscgg
         /+NfvtTVIVedGIwccus6d8BZsvBYNzsXu1/ilL5DtdlWmcI+NmszJTId5ypzAAHtYmj5
         XBlWF6qi2WbWs3mmQjyb/DzkQL5fjz4olsBGhRSHWKYBllh8Qp0aM9GcDMJCRA6wSyyQ
         sBk2XQRTM5VRLtbGuG3oMtFyYNfNYTN0R5zz6unJ/usgs7YXYePdnC0F9eg3cFPRtEAy
         QJaEUw4N/7KopA72y8crE2O6Hi4rGIapFV4qlyE7CZIupTww+u6ge6EcywcCxKk1CVmN
         ktpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0H5thJuPU8G6pmLK2NOKfBaNabB0jLRNNv2iNOjZwmoezMqhaxVaMyFKTzKNgDjShN8uR/T7He3DI7g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr89LJdukpsXJ9StBPNbMkIqHblyA1wocEO+Z7eHLnzdWKTFc5
	S2upaSvnDGfmH95XIZ6bgXzGcMFVstd4jcHj94Wc6/lWa6nqmugc
X-Gm-Gg: ASbGnctKEhdJF29GsTLk8arBmbpTKuaaSWsHGENDepQarizjBTY7d1Ujk39/jOadavS
	8PBv9hBcW3/0Fa99JaRaeMm2ISA91grpwbNxOIn5E5Y0HI1G0/y/3I8nNRFD0wMAeg/flUXPA6n
	Nmdwy/JTL7WF1HVYS6mPJoKu3IQapAwpcwKomLzPoItV1ANaiJhvi3SRyrvVrtcMIDN24Eg56Uk
	RLsTsP5OvM9FmoVfPQXhvXgRNouClEPOipRQrEPMk5C/Try1V2TDmIzN/EiTgFMQOU=
X-Google-Smtp-Source: AGHT+IHZqnO4VP7PrpLiYbkIXyeiZ8I28sisp22+YN53akKHQ23zEpc9KpH45aTzGIXW+qUh3UQM1Q==
X-Received: by 2002:a05:6512:6d3:b0:542:28b4:23ad with SMTP id 2adb3069b0e04-54229530096mr19882871e87.16.1736193048213;
        Mon, 06 Jan 2025 11:50:48 -0800 (PST)
Received: from localhost ([2a05:3580:f312:6c00:1b49:dfce:283c:7307])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5422383203asm4984082e87.258.2025.01.06.11.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 11:50:47 -0800 (PST)
Date: Mon, 6 Jan 2025 22:50:46 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Chris Morgan <macroalpha82@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin Botka <martin.botka@somainline.org>,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 3/5] mfd: axp20x: Allow multiple regulators
Message-ID: <Z3w0FngmguvM8u8P@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin Botka <martin.botka@somainline.org>,
	Chris Morgan <macromorgan@hotmail.com>
References: <20241007001408.27249-1-andre.przywara@arm.com>
 <20241007001408.27249-4-andre.przywara@arm.com>
 <675489c1.050a0220.8d73f.6e90@mx.google.com>
 <CA+E=qVf8_9gn0y=mcdKXvj2PFoHT2eF+JN=CmtTNdRGaSnpgKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+E=qVf8_9gn0y=mcdKXvj2PFoHT2eF+JN=CmtTNdRGaSnpgKg@mail.gmail.com>

Hi,

On 24-12-27 14:34, Vasily Khoruzhick wrote:
> On Sat, Dec 7, 2024 at 9:45 AM Chris Morgan <macroalpha82@gmail.com> wrote:
> 
> > Using git bisect, I found that this patch breaks the CONFIG_AXP20X_ADC
> > option which is used by some of the battery and charger drivers for the
> > axp20x PMIC series. My current assumption is that the
> > devm_iio_channel_get() call made by these drivers worked correctly
> > previously when the PLATFORM_DEVID_NONE, but now it's not working
> > anymore. I'm still testing possible solutions for that problem.
> 
> I confirm that this patch breaks the battery driver on Pinebook (and
> likely Pinephone). Reverting it fixes the issue for me.
> 

git bisect pointed me to this commit, when I've investigated why
battery power supply stopped working on PinePhone.

The problem is that devm_iio_channel_get() can't get channel by name,
since consumer's name has changed (from "axp20x-battery-power-supply" to
"axp20x-battery-power-supply.4.auto") and axp20x_adc has hardcoded
consumer dev names [1].

For other readers of this thread there is related discussion here. [2]
Chris, do you work on another solution of this problem?

1. https://elixir.bootlin.com/linux/v6.12.4/source/drivers/iio/adc/axp20x_adc.c#L176
2. https://lore.kernel.org/all/20241210224859.58917-1-macroalpha82@gmail.com/#t

-- 
Best regards,
Andrey Skvortsov
