Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3F92512C3
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Feb 2025 18:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740161481; cv=none; b=a6+2jfuJBSzwPdw6zYePWRMMTS4CVpR374U+pk97F4M+e7zN81SGyRR8cGjIp3diAXynTyn2OviNSwd3U/eNgnLQZslSEr7sE8iyyx7dmmstlQnzRgOKf2EKOP8ouULmEtvlkGxEEOrOdxWyeSdI7l1G4f8Gbt4XZNwI19vBSo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740161481; c=relaxed/simple;
	bh=ZXeJpH3wHw7BU/7D32jGOtOKsJu0r75YAYsNnjjEMw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pKaLl398MBp/00d6guUjbwNGx3ywAbnYHOkp7bBQ01mCmIAMIKOEmRLLPdYn3atggOOD5ocmILjr2XSSHx7GYn+p5bvttwi1tfAIONOX8NrKGWhOIx9gzY2B1dmkSVlQ4o+767L0A6o56kr8/tdrUZg/WkrQkXHTlr8FqN/LX58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGBwsApD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGBwsApD"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4397e5d5d99so15625165e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 21 Feb 2025 10:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740161477; x=1740766277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXeJpH3wHw7BU/7D32jGOtOKsJu0r75YAYsNnjjEMw0=;
        b=TGBwsApD+IBj5XM6rz0fgRmD3I28brLzcEvmBNB6X3EEsg9lmXLx8cmKv3PiG9wBvA
         fHWEIxv+U1G5iZixKxCfypHULt0Z5BM7iM1xvzpDs7S9VELdzxJ0Q1eYS9y8BtJAqAEx
         9OChIT4NG7RuX/3tehrWVpChbMmktLA3FKjJ0ghOhMCtkmb3hKfRda/fbw1y4BdGFTcU
         f9zNq35DWz1LjXLIP8xbGcWCsIXRTh08SN1HR99F/8gffszx/7Uw2GeCZAiPHA3/kezK
         K5nq/vMS7tpm2cBERXTlu7U1K2Z33W8EyyJnbUb35vIUFzVPY6WkPvSfG53DzBc8JCu8
         mZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740161477; x=1740766277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXeJpH3wHw7BU/7D32jGOtOKsJu0r75YAYsNnjjEMw0=;
        b=SedYSxh+a9V0RnP/RGs36H6aD+kY3aRbzj5oXMePTRecYG+rwrFmtG9qCsvbqHy/mf
         dfz01P1nZKwIR5SFsmi8x2/mWK1L3JsjMxkQDaSzEYm7KGS1tNxw11+sB9yPwRJVmsQH
         Qy9hm/j4zXkdrL0zc7XJrgq7SLZDNQchmwejItjjxqyVvlgn6N8GirxWq2FhAb9oZl1N
         0t9T+J0xCiJd9O+yPQlGqjJRfjijcmBHcz/dcrOHN5S0uXARO8lilcjIGwLYKDsdTAK/
         ZOCzxTLdd4ME6fT6l7/CoNNxlN3uxIvR6FNlbkDOweg9O0QVEeJzl4eS2Gjy4q5va0B0
         qU2g==
X-Forwarded-Encrypted: i=1; AJvYcCVYo/LnQqWuHuwYNsAkVc+McP84HKycdHgk5aDpAKgHDFnSCfCpAgNWhcelEUmz29mlI9XIQ7a4ttHrZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKFVzB4hh3dffn8ZDz8i3mnJ+CS6M/seW50Jn9ToAM/igpEcTH
	ieHuv2gJvEspoC9GBa9xoGVNPM0ARDJA0O/U3UfZsDrqZBE1Wt20
X-Gm-Gg: ASbGncvLSpQcBZiyvbV2TfD8TniOipvs7Pmh0Ax39XFaAxO8Dbcwl4m/UpTOUDxbozk
	th+hHnbNMGFpRqRTg2H97w9ZaB5soDShhOfQl00c+qh/og3auPqhgjzqW8bCKljfEe3+Y1a6ob7
	S5nIV86IZxRmD7n418ngsEeMOzYZ8A17XWBPqtbGMptsmD42GNBU0PdXNtIpJiKGfXz2La51qBk
	kUa/XfPfEcx3rd09y02m4Ni9zxSSRKvtefuBy5ereV/3dFo74HlOpbHnZa9/jpPs91yoPv/aKQ3
	DXc9OaSue5v4eU/F5QFXojNDTeY/UidLdMWJxPjgsus5YGDBBFjcm0QssWSgkyi733BM+zgDHFk
	6NQ==
X-Google-Smtp-Source: AGHT+IHF/tsnTWTEpF4H0kg8q1A+TidSDULFwV9+aTYXkyTCuSdYjLeHagAev7Ne5ELDSe/ppYbBWg==
X-Received: by 2002:a05:600c:1ca0:b0:439:9e8b:228d with SMTP id 5b1f17b1804b1-439ae218a14mr35556225e9.19.1740161476437;
        Fri, 21 Feb 2025 10:11:16 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258dcf08sm24356178f8f.36.2025.02.21.10.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 10:11:16 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org
Subject:
 Re: [PATCH 3/5] dt-bindings: gpu: mali-bifrost: Add Allwinner H616 compatible
Date: Fri, 21 Feb 2025 19:11:14 +0100
Message-ID: <2356358.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20250221005802.11001-4-andre.przywara@arm.com>
References:
 <20250221005802.11001-1-andre.przywara@arm.com>
 <20250221005802.11001-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 21. februar 2025 ob 01:58:00 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The Allwinner H616 SoC has a Mali-G31 MP2 GPU, which is of the Mali
> Bifrost family.
> Add the SoC specific compatible string and pair it with the bifrost
> fallback compatible.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



