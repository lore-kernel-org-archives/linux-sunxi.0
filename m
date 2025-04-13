Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8460A1A4E70
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Apr 2025 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744551819; cv=none; b=JmCLKN+USRuB7PDATtOHgQRLuDZNZh8dJYg/hv/yIBQ+mTVuAkBlqf+EeoBLwDdsaDlHKtp/h9Lt5o4unozfK9HJiYTZBoasE0FpmNfyd5AS10JUjFE2dUjkxDEKQlfecPPz+Q4OxPge+sxKSrdnr8g5f/pdpsRPLcZoxcc19R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744551819; c=relaxed/simple;
	bh=CaqNdZl65hgemUPAe9eut5/ZXmtuHDnKufCOoFTEFM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TfohLFKHouQ8oC1fbIGMsWVIcdpYX6wi9QsoT3jtvY4vE4ZNX+kPaKWgObFSST8DnIGxmpr5MjNNpg4bDRh5SVp4/68eK3Idn7vjzRP2BxAsut/Pp/3qkic57qBhxMyT2w/6ajseikQy1ae/rCls9YDbt3K/FZYeGEpDi0lkbXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4ZSxdeC; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4ZSxdeC"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so537704466b.0
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Apr 2025 06:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744551816; x=1745156616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXQZ9yojQV6stSDTDo/eH4vyNLxCP0mp6bCX3lmKvKI=;
        b=P4ZSxdeCH0h9q60EwchYscUjwSetyolVKHNZf7rRj29YinULwHuDEVUuqiEMjqYhZw
         diCp9dVovZp20v9ZER7yNZdSukhTz8V6yEWSWJ2xfQQq0vEy8U710d1ndO6dlGSh3FWw
         wOi/lC7Vgz+5JPazXSImwzjYyILrnvLa4dc6QTLuVLoXAp6vz0H9WGNAQcAj5YsZRArQ
         NeFe7jlkzp2nKLrcD9BzBVunQOHRvfZEFpIPSkQ0b5IDAF3lLdtPm0EWRtvUL96B9M9v
         3keJsSxwUrTNjVS3ahoPLHUS+qe42sdnuAi6TN5AZ8+SV0F29VveuVRm6ImGn+aN4eIh
         y4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744551816; x=1745156616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXQZ9yojQV6stSDTDo/eH4vyNLxCP0mp6bCX3lmKvKI=;
        b=m8LfQfSlV7PEJXjllEgf6y1PWWPvQka4uVaZ5qKXA3jk1bmv1Ne+chv36pQkYhpQRp
         Xe86HsPfmHWdZA5pOy1GwOoSeEM1lEacORr2F34O/Pvn2kp5L16J0qJHq8s9biFCDE+e
         n7ggCn9vY4JBrWtaXSIH8It87gqpWDwgIGnjBmeYpz6qPu4D7hTEzcxnAdmGmfB1uQEh
         KHgb1cZJWRHsZn8dSzwGws0YkFeqjmhvMTWH0Fd9PLJYa5Ns6bU+F6NW6Hmn1Qv6TDXO
         SEL/9hbo9rM5Ai1Xb4xOK1Tm52NQhjgsoUZtaeeyLecTSv1ThOk+Ta3rTpa0edKmDtjs
         Ei2g==
X-Forwarded-Encrypted: i=1; AJvYcCV3BJyRsXfvEovdQDg4kxf3FWkZpr6GtYuSSZHAL8XuNew/W1suvtjHaLfmkztrRrsEl5b65m1eZli+yQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAt277AoL71YWCoZ5BX97lQblltsgVjAN+PPpFcANV973Z9XfH
	AqYm+2gRYoIQJ34v5J5z5sAxKvAir71sz6lFrbmgTFs9pXXLfork
X-Gm-Gg: ASbGnctcztg0tJHjQDx6ve/PIH/Y8e6BFb4cHCnLywemQoXeqNzTfGJ7XEc4ogjETMG
	o/rMCC9K28llwNSfG2UppzTeDQiPBd7WEk15wxDbGTT7qUHoRZCV4UECFTMNgaRKE1W9f0OppIk
	d1X1Bisxgk7QcGzOMETKeS9qsDDeRVChvJktW6cnNXXGYvmGRPeCScPKIC+oruIn12b4RfNk8nj
	UrVXeAS/fOTSlX/38Fz3KvEMPKPn2TjfuGc8TFteGGHgu1JAifH4hK6wFEzJMKH6yBVvrkfLszu
	xjqzBDqnMg6/5RZe9gimRHVqtv1IKT6fYxpYkoC8ilGAl7A6mKKjJebtABk=
X-Google-Smtp-Source: AGHT+IEOIJ1i4Kh+VcM9sFRP+cgJp2vQQUT+Pqo4qfUY0eHTw4Probs6u1rivZcSvRWydAIs1ARTVQ==
X-Received: by 2002:a17:907:3c95:b0:ac6:ffb0:a2be with SMTP id a640c23a62f3a-acad36a0809mr750895066b.47.1744551815575;
        Sun, 13 Apr 2025 06:43:35 -0700 (PDT)
Received: from localhost.localdomain ([37.248.246.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be95d0sm749422666b.55.2025.04.13.06.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 06:43:35 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: wens@csie.org,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS board
Date: Sun, 13 Apr 2025 15:42:55 +0200
Message-ID: <20250413134318.66681-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Orange Pi 3 LTS has similar functionality to Orange Pi 3 with slightly
different hardware. 

OrangePi 3 LTS has following features:
- Allwinner H6 quad-core 64-bit ARM Cortex-A53
- GPU Mali-T720
- 2 GB LPDDR3 RAM
- AXP805 PMIC
- AW859A Wifi/BT 5.0
- 2x USB 2.0 host port (A)
- USB 3.0 Host
- Gigabit Ethernet (Motorcomm YT8531C phy)
- HDMI 2.0 port
- soldered 8 GB eMMC
- 2x LED
- microphone
- audio jack

Best regards,
Jernej

Jernej Skrabec (2):
  dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
  arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun50i-h6-orangepi-3-lts.dts    | 351 ++++++++++++++++++
 3 files changed, 357 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts

-- 
2.49.0

