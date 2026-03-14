Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE440225788
	for <linux-sunxi@lists.linux.dev>; Sat, 14 Mar 2026 06:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773471227; cv=none; b=r3W0grA3lcNicd1zIu34Ksfqjq6sh9j7Ewixz/aHK75MgK4yU9NIW00GOQSoSqe7XreYfLSfo2JKw/F96YNU1/wtCKARh27ZThytl803lDlpUEX2DSDiVYLAAsWbop2JXD9vY7bA9dfq3EQCIwbE1ZSSLqFvo8br45o/5e2/s40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773471227; c=relaxed/simple;
	bh=OGqE3n15B8Oam7oaufyM4egmtIok/tvgCx592UaF9pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XyMaBApRxZwF2g56MNmnIcX9PXrczxgw6bbT3NRr8gQuxCPZvaokdZ35R79VYszItWqDFW9/a/gNTae+9ITss0Lj8ww/Y1AKTS5HJZ9kSwozGdw/U7L5c6H3COkAQvOAMeIhFobFQCQMg4TqKugMGE2ujqpc078z/y3RPnu7lZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VyH1euzi; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VyH1euzi"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439c9bdc1eeso2958770f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 13 Mar 2026 23:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773471224; x=1774076024; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGqE3n15B8Oam7oaufyM4egmtIok/tvgCx592UaF9pQ=;
        b=VyH1euziHEiIwWO0iu4gZHILPOspKnNFtMG0UAuB9jGFB+999k6pvBNnZskCrgfMFT
         rmdVk1Q1YarLs48tmPRfoqKbsqdvBS8Y8Y+z5CAEOJ76PyUJiYktLjqBB/t+p6ts8V0j
         YCpE+o22HYUunqQDHV86lS9zIOdMuJzmQRAgbNH/aE+Q8SbaW7SZrtoJZh8MSbVJe0d9
         rgDgSbEBsKwFD86azJPrLvkfxpJrkaqPoNS4+AQ4ZO0gGDgNXbbreoS8wftn/LO94idp
         Roq8Fgb/ufhTxVJBRfAyLgcqtmI4fN1e8hjmd11dprt7NwcWZOenqrMEZ5QsnFYW2IOW
         unTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773471224; x=1774076024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OGqE3n15B8Oam7oaufyM4egmtIok/tvgCx592UaF9pQ=;
        b=NKyUAOoYaHzZNxOM9RFcmVecVDXaWShWN9OWh8Os11mTURJcK0hVi1RzeK/6/QYVnT
         2LOC8wE1/2qcIzznQCpAdOHfzE7Risi/iluPsWILkGSX8OLBm0YuzDpUFNWJ8dvUlM1Y
         Fp0cQ+gS6zvPDskAcX9JWzBeXfswCV3pncC/seHoqM9lXfkv1OJJ5imdwYTmMcv3OQqH
         YlKTp3ogdszqmU4AfHM+L2ecuc7DgsXAtwoc8M3RuaReqeTUECekoFBNPZHUxBVH5kcc
         dzTjg4TZN85S0fUGXIV8Y8U81rVvtu0iEhgUB7oXfjmm1gAw0AetKzyPgNq9j5OM1EuE
         Bb9A==
X-Forwarded-Encrypted: i=1; AJvYcCXS8lGwBScMpk4wNRQu6+N5TFETmjmuHqzPfKpY4w/7hTXPURtl5NcFaNMtOKxOxr4MqhATZbpBk3RyvA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4fa1DXz7ylEssBVLbNGl5Wau1aTyFJj6umBBaqooC3rDPGjvx
	JP/U0uaIQA/0JRW7/8+JZrMEgDPLLa7X/z+bFHsgI5bhHWhZOs5w1M4j
X-Gm-Gg: ATEYQzz8TyCpeic/4HzCc8dyVXHwD8pbpsZiUhIM7C4MEjyYnFBHoDuABQ+hLY/sTXc
	SiiolcLrsJeSh9QMARvC93Y0bhAgmwQMzsQU4EUljc8QgIPs8QOGzKSB1o3Ir79sMHfwA/5U5FK
	VsZbWqZYwkUeTWFvxGBeSzMcUsFmfUwLSy22bvwwXh2xwVE132g96ilNlUF6awu/tryP6jBnDim
	YuxEwIBORw3ocCjcARBJtXqK9O4YUelnM/6NAqjXP939V6jt9+eKMgwO0667M3fsLtBRb3EJ5GU
	hyYNDW6dEZQe/ipZDofCY83RtS5msZkUmC3kX9VrKDnTBKMpSpkAg/1HLpdtBwpFmeIhTZftBNE
	8WH/+T1hUF9b5qj66Wosd+DNN4v9nJcCffozlDDKddA7XhuyD4JBRQgiY3/CmOQi41rfYVMKXNh
	WdD/grlDYA3UbdVNI+GJdOPA7RnxYVvBhhio3iuRgfYuVkfZznVOoEvVemlEglYGWNPjCp9Ih4p
	a5JGQ==
X-Received: by 2002:a05:600c:4f8b:b0:485:3a27:a960 with SMTP id 5b1f17b1804b1-485564981d8mr105428765e9.0.1773471224016;
        Fri, 13 Mar 2026 23:53:44 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-12-163.dynamic.telemach.net. [86.58.12.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556422338sm40021775e9.7.2026.03.13.23.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 23:53:43 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Yuanshen Cao <alex.caoys@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
Subject:
 Re: [PATCH v2 2/2] pmdomain: sunxi: Add support for A733 to Allwinner PCK600
 driver
Date: Sat, 14 Mar 2026 07:53:42 +0100
Message-ID: <5083201.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20260305-b4-pck600-a733-v2-2-ba6bbed7d253@gmail.com>
References:
 <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
 <20260305-b4-pck600-a733-v2-2-ba6bbed7d253@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 5. marec 2026 ob 04:34:08 Srednjeevropski standardni =C4=
=8Das je Yuanshen Cao napisal(a):
> The Allwinner A733 PCK600, similar to A523 PCK600, is likely a
> customized version of ARM PCK-600 power controller. It shares the same
> BSP driver with A523. According to the BSP provided by Radxa, unlike
> A523, it doesn't require reset, as well as a different pair of delay
> values.
>=20
> Make reset optional in the sunxi pck600 driver and add support
> for A733.
>=20
> Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


