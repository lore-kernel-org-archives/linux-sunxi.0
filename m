Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDE71DFDE
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 07:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268682; cv=none; b=Cm/fReEzZ1V8FtyCqy/3yWL8U+V1ZssvIkc7UaiF7EBryBBLX5h+cQV3snHUYJFI1+7X1oo8Ty51x2ATWBq/7NhPizmT5D4mdBsjlUTnJjJu8JlXnGfr6ivAmzs16CtAHm/uJbkROJxN76FcHqgeIxWRXpO57q+kW0h2JcKGlNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268682; c=relaxed/simple;
	bh=cs98PbtKPUYAWZfSTgmbNp3F14K46Gf5P6JEqg+5eQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HT+MKLJh6k2iGgVDh99UR+6jgAvpD1TI3QbpHE+rs44SuqDodFY/Stgqj7BLy/7jRzOQ0wTc9GL1g3saXzVXVAOkf+PlQlNCgafi/gNnAtYXP6bbH9TGx/X+bpQD200PJhBp9+zLihbJ5F4CHyEaiFai7H8HDrNwwOPLvsbxHJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVC1cb9G; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVC1cb9G"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c1efc457bso183950f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 00:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744268679; x=1744873479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cs98PbtKPUYAWZfSTgmbNp3F14K46Gf5P6JEqg+5eQ8=;
        b=LVC1cb9GlVBKlONmaxArjZBHpiJWZnseg0YVJZMG0uiZTP/yXakHgojh17WBMjHqNx
         f3xvma390D/pUpcnWoC+T/2OE9q0RmbfepjiWqW6aU/5/jVLCpsxIza0N935n1n44fuJ
         95RMnUXCt9eat9GMdR+PldoSKcRZgVfeT4IjqgChD7o+bemKWFhzBL4ciI8CaiqaNQo+
         1zC7QcjNmAsX96Mu+LCttmsz/IVIgZI/Tim23GYTSrHFPqTzkJe0R2qswWScnFTYOQsc
         7M2YMSEwhcZKeFKw/iYIKCk+00RGdLeTyKckYThCTvMwhY16TLRG2WyW9ZRTGN59xBtr
         a4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268679; x=1744873479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cs98PbtKPUYAWZfSTgmbNp3F14K46Gf5P6JEqg+5eQ8=;
        b=URg8oYZBrxSTd3pCCsCAtHspO7hdiMYinsQiwkDEu5tgBjovF4DG+sbTErupV00lR3
         k/S0zgUL2QUWWqcNz7z6Es3igsq+i2YsA+6vL1dY8mVVgFgvdLESuh82OMAM6+wbVoWT
         GKneJ2AGDV0cJkRMUDc8581LcfZ8t7FWbyI7i9z9k8qYOJMZ42Jqd4hGCE6vW/K9R6HH
         CrvTSw0Da09QHNzjAt0ZTO782/ytY24zsrxnL96+F8tvx0m1XeyW4nr11JDOIPR94ZON
         nMPCVRvTkEVX9FOzZU59eK3Jx1qDJh00LTmgYWqAW+gv5h5cJ8dz2hQCwVpebA77KfZu
         JIEg==
X-Forwarded-Encrypted: i=1; AJvYcCXiO48FnR90Hy00p3fhGXUf+XUTU1PugjT0Uomq9ZgB0n13GaVEQfuCLOkotnl6bD5ENS/LXXVsqatoXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwC55XApMbdGUZE/V8rRVhqz8x08zs2N05HcKv+S8D2l+TjpjIG
	MW/Ui6R1IzYecKoxNtO+lfQulea8Cu12o+JDa3SjsKjaILA7kxhw
X-Gm-Gg: ASbGncux47XsSoxFP/U1fzPiOSROIdVwVOV5m2rvQ7PiaeltLKe7ac2H0XKkswZwKZV
	8sl3tzBBvdT+RktmgS7oCZz87NTv/DKae4dy19DjsneTOzKzSe8+QD5kqEGOIPN1AipuAKX7InW
	uy1LzNxBSXCVyfLNm2/BFlfCNlkOwLwiDApmhirOOom6pjrEMxDeCP8yC/WIz8prq8eyxaj9Nso
	sE8dCiW4sef1pgkgLMAH+y2hsXu7KyrPsZX3kOQOlYdTvsw5sjgzz5/kzZVG65ZuoTknTwv6KiZ
	/mGNsurTFXsJm3bA5IZlQZZaJ330cLY8fYkcWOC2uFkii5euGn1/dlHrItqXzagxdLBgeTHdNNk
	6SazaPxUHtcEhyc7+
X-Google-Smtp-Source: AGHT+IGF2p/7HAB8hJNNMWrRdkyWilShhbGY7rgseLQ/K9F69kSeo0JAu823ulBpxf6QI/Fua+I0wQ==
X-Received: by 2002:a05:6000:430b:b0:391:4bfd:6d5 with SMTP id ffacd0b85a97d-39d8f4f1a9emr1172471f8f.52.1744268679185;
        Thu, 10 Apr 2025 00:04:39 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c90b4sm45451145e9.38.2025.04.10.00.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:04:38 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Hans de Goede <hdegoede@redhat.com>,
 Olliver Schinagl <oliver@schinagl.nl>, Iain Paton <ipaton0@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Paul Kocialkowski <contact@paulk.fr>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <mripard@kernel.org>, Ian Campbell <ijc@hellion.org.uk>,
 Adam Sampson <ats@offog.org>, Zoltan Herpai <wigyori@uid0.hu>,
 Siarhei Siamashka <siarhei.siamashka@gmail.com>,
 VishnuPatekar <vishnupatekar0510@gmail.com>,
 Rask Ingemann Lambertsen <rask@formelder.dk>,
 Aleksei Mamlin <mamlinav@gmail.com>, Peter Korsgaard <peter@korsgaard.com>,
 Michal Suchanek <hramrach@gmail.com>, Icenowy Zheng <icenowy@aosc.xyz>,
 Stefan Roese <sr@denx.de>, Phil Han <pengphei@sina.com>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Jonas Smedegaard <dr@jones.dk>, Jaehoon Chung <jh80.chung@samsung.com>,
 Heiko Schocher <hs@denx.de>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v2 1/8] power: regulator: Add a driver for the AXP PMIC drivevbus
Date: Thu, 10 Apr 2025 09:04:35 +0200
Message-ID: <4971028.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20250409002036.12212-2-andre.przywara@arm.com>
References:
 <20250409002036.12212-1-andre.przywara@arm.com>
 <20250409002036.12212-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 9. april 2025 ob 02:20:29 Srednjeevropski poletni =C4=8Das je An=
dre Przywara napisal(a):
> From: Samuel Holland <samuel@sholland.org>
>=20
> AXP PMICs have a pin which can either report the USB VBUS state, or
> driving a regulator that supplies USB VBUS. Add a regulator driver for
> controlling this pin. The selection between input and output is done via
> the x-powers,drive-vbus-en pin on the PMIC (parent) node.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Would it be less error prone to auto enable Kconfig option when compatible
AXP device is enabled? That way defconfigs could be smaller. Driver is pret=
ty
small anyway.

In any case:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


