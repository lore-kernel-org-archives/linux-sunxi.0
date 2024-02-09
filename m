Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449A6288B0
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Feb 2024 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707481304; cv=none; b=qXUQJtkVbseEEWYVVB31RsueUpKsmwsg1gnysszGLA5syLUTvjiUG27Y/OqbZQEHUBODTR3yfWf2MPb3eUzxbuXW2zrEzQVC+Ai9aD6TnccZE1DIZMD3jo1fc1nHaEXS95o1gq3HEge0AHIJM/07WVEjzyHHOukwiGdS69B0o8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707481304; c=relaxed/simple;
	bh=xkJ2IoMqXO7ojN+a8UNzT1TouSyMOCFtrHGj+yqnkhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pXlxXs6MdxDZojxpWJHJ4YWIzQDVKZh9lBhC/a7HtApPrWHDTAuetwctjD/2qTbOfrvly4rCYCMgMgbXI7+5we79j11ObFiAWsopXfMGav+cdRsjgKm3pboZBgxz/Ropm8EBXSDqhT2v561n1I4RrFZg87P8B9GNgdd65ZLOEE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2oOfFB3; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2oOfFB3"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a2a17f3217aso107460766b.2
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Feb 2024 04:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707481301; x=1708086101; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKPi4zPxIhG/N5fdp+pYAmcapEcDw+SDHxFi/+s26io=;
        b=H2oOfFB3Qby/rO/oUt3bsyst95lv+H3eXHO5SpDtryNrqXsCrscKj2OlHHJQBm7ZLN
         +rGyAXQLHVP8ELzWWIq0owFZQyX7hVRgM7XXAV+TTHWw8pOrPvtu2TzXwLv3rju6LxGO
         GKJ0f9r/aZUmB2uMazPZKYZneOKJnyFAozqT8Iw4rELaObvlyA6gTvWbA+qVfJhiulg9
         Yhe/r1qj79RjIWdUCL17wlbA3pt+3MdnarrHCbmNlrBB+UVQ/HNAYdEbGMAvTmrsWg20
         tcENuxPEF707fMPN5Afk3KgoQcq+M/r7n9GKgeKgGTEgY9Vb9Md1AqAL8FEYIEhFBy24
         OBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707481301; x=1708086101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKPi4zPxIhG/N5fdp+pYAmcapEcDw+SDHxFi/+s26io=;
        b=jx+XMlb8MO8gNvSRl+zGTW/qlzPEI5WkPSf9p6y0GNpZJUkvW3NKdf58LEMHAiQ48P
         NNsGePQjwaTw89loPSkKDJf21pmFS9/Emn1w3P6z6cTLO98VqVGnW5G7HKvlrzgfluzG
         Kxxd6bDNf2sh08z8fpAc+C5+thLy2NMBlD2vaSxYZOUuwEhVHk52xP7LuGaIlA8jSwxZ
         NuxcYnZX75QvsUE7xUuZ1uTEPFrNqef3PeqQFNarQ6Owoa0QLrAWRvPgfcn5pvZTP1fW
         sJ+yuQ0GlMTtcmEKQLi58lHbKhZd/EMx4fjdsf2Vv4UtS7hrJzf7nMYh+BX0xjow6CTh
         1Pmw==
X-Gm-Message-State: AOJu0YxIsHpfvq5XKuYh3IBPqZSI15HAfejC4xGRcxzbdlySyFL09l5P
	z0YnfCMT1vm6yyoEib689OPKGQ74N7UA1JbGBlKZAeMJKnS1z6nW
X-Google-Smtp-Source: AGHT+IGpj2kP7b9IxRiH/P8koINgLxDZ4g4wiJ2ziJsnvotXZME97MjOJDgICHT3AunmEVq6mjJrYw==
X-Received: by 2002:a17:906:13d2:b0:a37:2932:df1 with SMTP id g18-20020a17090613d200b00a3729320df1mr1159787ejc.29.1707481301606;
        Fri, 09 Feb 2024 04:21:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWAEI6z43i/Szq7oP+stO2wELDI6t6MceoOfZAaa/xBLToHbqkz92CxvMTaoYoJMrp83XMS6mZB57hRTWSbumpjaymvh5MPk1x6WG2/ObCwnthfsA+Md74csh112Bq3gHCJE+cYUaNx1z/cez6NA9wY0+QvCIM3T00SRKGLGHo6uTVs1z21FrQ2xFeFcpqYXZGzaCVTiwZW9Tk2F6GtCLImNISeEHuKJEI1IUa78adptoQcsmfRuP8QTAmC3kd8JCRfgRPiRJg/jmIaEsSZAfdhH2KQ5hp7w9g/IuGVD4pSaGmXQEWvuMwtpkMAgaSOPTrD/krIecthi0pAkAtCOg==
Received: from jernej-laptop.localnet (APN-123-244-98-gprs.simobil.net. [46.123.244.98])
        by smtp.gmail.com with ESMTPSA id m21-20020a170906235500b00a36c5b01ef3sm709277eja.225.2024.02.09.04.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 04:21:41 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Alilovic <nickalilovic@gmail.com>
Subject:
 Re: [PATCH v2 2/2] arm64: dts: allwinner: Transpeed 8K618-T: add WiFi nodes
Date: Fri, 09 Feb 2024 13:21:39 +0100
Message-ID: <5751321.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20240209115759.3582869-3-andre.przywara@arm.com>
References:
 <20240209115759.3582869-1-andre.przywara@arm.com>
 <20240209115759.3582869-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 09. februar 2024 ob 12:57:59 CET je Andre Przywara napisal(a):
> In contrast to other devices using Allwinner SoCs, the Transpeed 8K618-T
> TV box uses a mainline supported WiFi chip: it's Broadcom 4335 compatible,
> packaged by Murata.
> 
> Add the required DT nodes to let DT users know about the SDIO device.
> There is an otherwise empty MMC device node, to receive the MAC address,
> that firmware might want to write in there.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


