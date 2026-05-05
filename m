Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8FE48BD3C
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997525; cv=none; b=hvs9kRtFWesdaCT6eGcZp+9FO0omQ9Prghere11ju5+uXHtzkLQK/fAt7cjzIggkim8fdaeHYLsinucE88Y/10X1xLovWht7s913IF7JIxsMXEOolzif5prtdB/lenErxqKMruuputRMHIzISbCoiNY2/pfyZse0jrCwyZcSEH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997525; c=relaxed/simple;
	bh=/2YwgXM9F3f1htySNFFwNXvypiZD27bWqqyQPFCwZo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=InO8GvWBLXsV0GPxTh3AfnDr2TqvB7AI89qvMbb+6nAZCi5RXp99xABUfaUBupQIelMIGdPzd7edSAnYEtRcq7FCr1uHmow5270mE2Vk4zY1q0I5vpHR1VrXpZIVk8Lxz3SpTIYY01TU/uEc71M2b+ISltJLxRiTS7+kpKwDwLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzAaLcvs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzAaLcvs"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso46323935e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 05 May 2026 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997522; x=1778602322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2YwgXM9F3f1htySNFFwNXvypiZD27bWqqyQPFCwZo8=;
        b=SzAaLcvsoiNGvQ3lNBxrah/GUFIr1XP9x3Qbz/mV8Wq9OSTc4hjZZd+vaZrqPHyiiv
         RD4VHvxTJ46m7zBPblD/ETydgdK4AMGbJ4diKzKGGlDnZhP6cnkZFVDNQRKbrdvWfqAC
         i/4wWyA1EWNLG+50eboee0745jW1Rsur0uDnl3BCYi7FTuc8W4VGNdRqYCRZWnxaW6X2
         11VI5F0fHkjKf5ksOkkS4Jo7tCVXrF58uVjBKclexrLah0Y3vTls9tPl53avJ79QpzEi
         20OIAUe15TX2rAseG72mv6tc8k1C3xSSaQNu7APhzIf0QCl8NlyDJPdCbjgWTcFZ7psJ
         twfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997522; x=1778602322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2YwgXM9F3f1htySNFFwNXvypiZD27bWqqyQPFCwZo8=;
        b=OFh1RNwXK/BsYPcIQxwKLiPjxZnmBv8IbiBLhb3xVs6pYXL+BMMhbLR3tSkDAUc8Rp
         rHdJMkLKFILta4uc5KtVbITXKQtRyBpKHUWj0bRzaVbXIcwzXt/6HscC+oL8nMOgw+fu
         Y6OxhjgOEERB3IihMyTlaJzNmwSH3ehqjpZ9UouYFpgH2KyOIn+d6OxXvkvNBicwZUuY
         BrqbrQrIL2s/0UDMXl3ocWHAPNNJeNKlNC16QUWYSdi674qzvsWkwngr85Kyqq05MFeG
         B3LO82/x9rlwXTme1ySL99p7lRLHGT1G1tES8Lsv38JJ0Clq69p4l2bob7mMhJzIqHT3
         45PQ==
X-Forwarded-Encrypted: i=1; AFNElJ/At24f8nNtuePMMYQqzxeaqI/qtPFEqt+/fXdvpU5mapTfyQzjSm03KJjkgg6Etsu++3Fib47MLLRbyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMKfeGntaAhSANN4W46bnPQEv5dFpfKOydNWRh2GMKXhstdJ4c
	b/y1w+qtYG2g+3pPNyjZ2HttFj1LH+Zi56XWn779hG8kHuQmS3kq8SZt
X-Gm-Gg: AeBDies4ps2ebHAGzVLFGsM7oYOk3END00hpwcjbRL1JaQSnypDXXyTZgRsqAv344KT
	bS19L+5IfYLinPrpkxQNihxRTOmXLcqgLK0mscse7QGdKeg/MxJBuaVsRwoLCQSHJpIy9nkNIU1
	M5i0jOnpsJDPl6ttwFDMBCKp7bt4aNA05ZNI8O3e0wJk6OsyKh8LcxvZtdEfE+tb//9JhoAkgru
	+Crj/ephSPDCzhdBePkXXIIzY9Zk5B0xI7herZRltlvTo/RY+kYDBAwWwkMwwn3++3K5sZww+IS
	LcvUHqVns4dD1F58NJ96kfrQ9tWlrqq6/YRv53KVyMV7f3pliDXklbANZUOyXelt6z8BO4nAR/v
	dEA9HPWhDdzEHvoyOE7W6ekrBoOpByE3vKMoz9AhnxAAG5ThhqAzkQHGmTHUhZVLuls9uhHbRHw
	w2zS6v3X9N+Tfwta3V+pvwzKqVcHsl730AhsOYB/IPj7rWOjrqJc6nM64f9yZdfnyfIF/FSo5lh
	ZA27jieHitwS5JZ6P8=
X-Received: by 2002:a05:600c:4506:b0:488:9e43:9690 with SMTP id 5b1f17b1804b1-48d187daac6mr60424265e9.10.1777997522093;
        Tue, 05 May 2026 09:12:02 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d17710bfbsm26884555e9.7.2026.05.05.09.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:12:01 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/7] dt-bindings: media: sun4i-a10-video-engine: Fix IOMMU count
 for H6
Date: Tue, 05 May 2026 18:11:59 +0200
Message-ID: <VwMu5tg2Q9-HLmYXaV-qwQ@gmail.com>
In-Reply-To: <20260505134812.408316-2-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:05 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> On the H6 SoC, the Video Engine has two memory ports, thus two IOMMU
> connections. The secondary one that is missing is likely used for
> reading reference frames. The newer H616 is the same. On the other
> hand, the D1 only has one memory port.
>=20
> Add the missing IOMMU connection for the Video Engine.
>=20
> Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


