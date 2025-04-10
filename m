Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0B51CEEB2
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 07:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269584; cv=none; b=PQQA9Ve5fhqwrIEs5xaFPAQv/CCmnHdj8qHP2GH3rYJ6NxQNLzVu9ZesBr8NZidfUa76m7UZ8c2gFeAdUbV1X3MiaT4mP/VfnTC1ZRF5Bb0SRZyZ4EvsGkDINDxNZ2kf8mMCQwNKG6fbYfDg38sLRVzceJ+IIyz6oeIQ1ZGovXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269584; c=relaxed/simple;
	bh=nLQlgrMoy82GYCbXYbFq6unl2OVBU5LRa5pWPRzOI9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BTBm+1p9r2ZkZn6rA5o75IEsvoJ3GompX1VaxhNByHNU9v76cIR78onvrzeOGJlkPGvYr3zEc4OhqAN/qIHeKEzfs4gEJWLd9AoA423vdcOvsAT3g7l0smhVMpZhL2EKNqzmQEoHRMslDKy9eJsuw+k+Fe0r9FJpagEjkKGHDLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeRd0/dd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeRd0/dd"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf257158fso3599435e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 00:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744269581; x=1744874381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLQlgrMoy82GYCbXYbFq6unl2OVBU5LRa5pWPRzOI9c=;
        b=PeRd0/dd87uyM/yKn1eF2clNREQYmoMuZUoudjpEK96KTb8goFB95F4DDpYu5OPZnC
         7lkqufYzvoRF5sGrC9ILGEmdZot3UcrGKps2qlS5bYMWEi11rCIQsvX3j4nLB/95x/sI
         T1clEM8OXlvULzrHfnaq/GZc+GHmPqd3D/56Ne0febCmUkyt4xLuY/QYwaWYZ1uyWnSd
         XrAZMO2urkDZbRSbqa/x3d8Osu8u2PeSns3WEgM7Vg1SndAH17MQo2nquxv7wzIOI4xs
         TNJQRiJGwz3oi9pQalqPn/dmdo6BL/OEj9+arfmfagziLWPqjrtRPpeO2H/QUuut4Nhx
         jGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269581; x=1744874381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLQlgrMoy82GYCbXYbFq6unl2OVBU5LRa5pWPRzOI9c=;
        b=FftqtVPKsnm+TuE4q8Kvf0Jo542TCe3r9FiHB8QaFdkU4j3HPehdHJ8h3nacFfajJj
         8rNM4JfBDRd8ZkIlJc9M7YWD/ezVfP4opTJsc8+NEzrl4akeN8YADSwfV0ClA5g3PYmr
         GVzb6Yv6QNcNn185PJx0c5ZgYWR6l0fCEOT/x6GUECwJXVtwvu8a6gCSLRYQrnprMUoo
         Y0G2t2EIWIa1z+6uKLYtvK/T/pdVKMKCmzbubqFroyB++jXiJEvgzVtcZ6A0pjIbwNAy
         wtkp23VKsEO4TJvLHpP5Y9FhqZkvj7wDZimabIWjJQ35vpt9I88WWpByFSs5TdpMNPxp
         u9ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPnrQnKrWc0aP7P2Ka/A7qZ7QTTd23MZw9UFcbpnw80+vHvIrrRVgbjTZOkjBmv5yYvrrxk4ei1rwFtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTpIvRJ2125XHcdsNkaYLUcTI2GvWVirhvea+7RssaULDZpZMi
	/b5YXo70jNTXTT2yoh+V42s1D6lIG029Ujk5n0qVWJC/m2/9/cYe
X-Gm-Gg: ASbGncucDZQcvwroE8hl9e/tfeAVFuyu7yg9UCmyciN8eSHTFhltgeJjCX7ESKXjNN9
	bCsXHgl9xGfyli28O2jFXY/46vinN5HN2HSZmpFGc+ssDRTZpSwVAAIKZf4vwwUxxDt++pzd1nn
	cKYymRhiudEVaZZR8PFmiXxB3rMXCFltGAnEnHY53XZTz1K7k6dlexadlgypvEuInbHfjg3t6ip
	vk4rzF+OnvKyPpZSoKmOMg61I/qnFnGTL06TVZNyg6FB0A9bgVUCQyK7jJ+pTe0F0yeZOWoSDxc
	soeu66FyvmmvG+4FLH9XlzeB/XT4+hp+jiUvlBw6A1gweF+tYbbZdyuPiRvEu4gKMuOwo++fqnq
	lbPaRS5H7FSbVcyVx
X-Google-Smtp-Source: AGHT+IGfNqlvzVtINcMCObh8Pdg/NUrnf3i8B3l/L4y+h5lADSteCrZVRbbmzwMvHJyYENlMhRmtRg==
X-Received: by 2002:a05:600c:4e14:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-43f2d7af23cmr17600255e9.4.1744269580932;
        Thu, 10 Apr 2025 00:19:40 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d26bsm45444395e9.22.2025.04.10.00.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:19:40 -0700 (PDT)
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
 Re: [PATCH v2 7/8] phy: sun4i-usb: Determine USB OTG detection pin from
 devicetree
Date: Thu, 10 Apr 2025 09:19:38 +0200
Message-ID: <7788519.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <20250409002036.12212-8-andre.przywara@arm.com>
References:
 <20250409002036.12212-1-andre.przywara@arm.com>
 <20250409002036.12212-8-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 9. april 2025 ob 02:20:35 Srednjeevropski poletni =C4=8Das je An=
dre Przywara napisal(a):
> So far Allwinner boards controlled the USB OTG ID detection via the
> respective GPIO pin specified in Kconfig, as a string. All boards should
> have the same GPIO already specified in the devicetree, in the
> usb0_id_det-gpios property.
>=20
> Convert the usage of the Kconfig configured GPIO over to query that
> information from the devicetree, then use the existing DM GPIO
> infrastructure to request the GPIO.
> Only PHY0 supports USB-OTG, so limit the GPIO request to that PHY, to
> avoid claiming it multiple times.
>=20
> This removes the need to name that GPIO in the defconfig file.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


