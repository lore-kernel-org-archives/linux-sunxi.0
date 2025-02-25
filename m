Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94C726E620
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 14:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740494216; cv=none; b=l7ZMVvH3oxZnGh9jpIMVmQ0aMCRKYJ7vQzTPDcahyCZG/5cbccAXsO5brdalQP6EA23pwstcgnXUb3/CO4lVMz957zj/Dm1bOEywo19olobfvUT9KZ3R+jwyTKRZ6dIVFCbei4AoERfoh1R0aFkHQrfg/r/TjQ3SyI2Jfwb8nfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740494216; c=relaxed/simple;
	bh=GIMdMLj6BbS/txxma/JVtTFZH3g2DvEeT4hV4F/TP48=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=cjhFWu2aAEQOanUuCBfz1sr8E+Sv148KJ0TcYyIs1r6ubLKK84c5A7rKDISLU4lQDnq1afvWDYiBMTXqY0/UV3Iw3BPkPGRT8nVcI1afYOb39CoYRmHGF2pN7FWmjjanKsBVuU5xrD/AxbNUE3UyEmEv3T2bioqpXYrJ/XuDSVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5eFRb94; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5eFRb94"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4399ca9d338so34882735e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Feb 2025 06:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740494213; x=1741099013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwiobQ+ov2NGgIChlOLIJyU8mL2VZ/8aCAPBJC6i4xg=;
        b=E5eFRb94k/lAohWscfh8NWW/UKkRJsTBMyPUnk7VIFh4sY8G1FmqB4vLtItmH5M0F+
         50HEnmm85bgR/rKCkhhtxz07ivKwErHDAgWtKTtli0v/DKWiCaeXOWnKMfd5dhKGvN0s
         32BcLZ6u1m9Oa/lQHmdmrpUVtBkbI7nPlgYcouryQadcP5czZLZdXoI6E3WuXCvdJXAA
         4Ar841bwvb6Bt91IXU7QozDVJ+puLp/MFAFfF6lj84iKtY++fRHK5H9obBsZYdEiay4F
         2HiIJv41ig600ga+ILjnaIZWd13ugvYRMXncGEGcVXe+8STLB7eNDHMK8C4Q2AvGMlXK
         HCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494213; x=1741099013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwiobQ+ov2NGgIChlOLIJyU8mL2VZ/8aCAPBJC6i4xg=;
        b=ZU54wJLcZYehv2a70XOwswgP/Z0KZvpVoTMc2Q/5EsIDVKViskTob5+yDlEdOF9una
         2mYTB7jfjWqmkI9z37HxJSh0mEqxjDPCnyu+U8yhXF463siQQxJD44F7WypkcHBSU7yZ
         YiJeh4P0p0xpA5/GIWASm6nDhNan2tXD863PuSD3asWOhkdSQdJJAl1Z0N6FH0zLcsyR
         5xPF4GpE/tWQeKVhUQFUyDT0w4NFYtOUJj5B5V0cW+aGFgNEcFACU5JlVufNgEeJ9A2F
         3SpALmKmJnS/MbTLp2yckpJShFkp7eUiNl145Idjo9poGuy+zFPzk7Kb1fDv/BRbupYm
         Niwg==
X-Forwarded-Encrypted: i=1; AJvYcCUkp5Gt/Kk+CvUWHscx+2+KQ942vbZ7ISoZ1T4Eqhe7jlJKYoMZsEUTfozA9HWmL6osIGKOTqNRNHAeTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy92Dmfoj2gT14LIp4oj7Q+dTHKUuOE+tWOSMvhHc7JdicaKWng
	rCzVuX0s1rrEZHYOY754vvJ9Dq71Va9mHtfJGeqNkZqYNLgocARU
X-Gm-Gg: ASbGncvvkriow8llFj2b09L430Hcqgzkf64FUxZrLYErTYEjAzroPJjjscP8loOWRDF
	4FCU3ox8xaylzaWuxkT95uzfDyoMIZQujoVC48weQiO6ID8myM/Pe25OtZ1Xpyxa5zIpVANmz+A
	z4ofHMPYB5zy7sYHjwmzhDrQoSWPuPgLdBTpgYFCzpo5XQje7zamQPsWkRDPWx5MqW8UrOoamSR
	KoQfYO/eVsjcWvTKySIxMOPv3Jd9UrkNic94HPK/MftT2AJn5+vN8xVYYB5gd2pUoIFckwu/PWV
	o7moVMPoooSa3lvaljNPPDMhg9tuPt6UczTD7koBDu9NNBJiE9C9i67oKU0LLy0=
X-Google-Smtp-Source: AGHT+IHqYyNIhjlrYWJKlXkPU9c+6qRV/sFcYlFP3Oo19VLSLbGLfo17beLiyZrjDoc/9WsbiQBXqQ==
X-Received: by 2002:a05:600c:35cb:b0:439:942c:c1cd with SMTP id 5b1f17b1804b1-43ab0f41698mr32827425e9.15.1740494212733;
        Tue, 25 Feb 2025 06:36:52 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8829cesm2474493f8f.49.2025.02.25.06.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:36:52 -0800 (PST)
From: Regis Dargent <regis.dargent@gmail.com>
To: 
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] watchdog: sunxi_wdt: Allow watchdog to remain enabled after probe
Date: Tue, 25 Feb 2025 15:36:37 +0100
Message-Id: <20250225143638.1989755-1-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

V3 of the patch allowing sunxi watchdog to remain enabled after probe.
This 3rd version is mainly about code cleanup.

Best regards,
Regis

Jernej Škrabec:
  I wouldn't add checks on CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED here.
  My understanding is that this config is already managed in the generic
  watchdog part, as long as the WDOG_HW_RUNNING bit matches the actual
  state of the HW watchdog timer.
  I only saw one reference in a HW driver, stm32_iwdg, where they cannot
  read the watchdog state, so they start it and set the WDOG_HW_RUNNING
  bit so that both match.


