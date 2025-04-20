Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D553714901B
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Apr 2025 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745142511; cv=none; b=i9ZwIkf7BYrsbnwTnSLR9fER27gxU3DDBbYlsGAoXGOCev0VKaGMPhw/LqQGgXJSmSAnpylD5NGTbKYj96G0JwSiveIdsq7hJQAHjd5EafAJoCSaqumOX2KrRlhpa+qKbw1+jusZB1C9gRisR328x+/DWF5J4ZShpfRTJvBHNz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745142511; c=relaxed/simple;
	bh=mXn0pXoDkpgm87elDCujDFMi7Ct5l0c6E7cMwevo+KI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xjm0ib27WK9w8D6Yfe6LeoOdNYCvPzKavkRclN/rfDXjGokUKnuRmfOGakp3OFJLnsWPSq6dsO7pjZRB0Ri9/KShnKGn6WvemLGxfhnWHXQG2iTkB8oYmTb3/srm+CWGHbtqXb6716vWeH0jiFP2v/eJVRL75chYteFtL6GmyYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cu3Ji2TZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu3Ji2TZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43690d4605dso24418615e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 20 Apr 2025 02:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745142507; x=1745747307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KgaxCKXwOIlos19HVgBcYzf4uVbvhuNW1VHVexNu6qo=;
        b=Cu3Ji2TZKezw+r1ATb7mIdGZ934JHv7HWmXFupN6WDWnHDr++JNN3Fd+djpIRBSzF0
         DE2uYoae+DlXgM9f3Y9WnO3UYIDNrKpW+q74ScYST8LiBHvXtYDYplFL2B0w0oAmDLmN
         bNvJ3yPfgQXDFH+dtzD4m3WKXoyvk7XBjqEMAgjhzGMtlpd/uAaaid6rCeUG67oRTgim
         Rh3PBFm8D/vbVK2qBadDomn/Hl8xHAnPmzTlugaU9+X72EBIX2LMOvH/Py4X7cIzLqDm
         v1EFCISZKdCEuvAVIFxsESmMKm0Lbct3jyiq95XyRtJW+tRjnmIoAxY+syG4onFxeS1P
         5U4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745142507; x=1745747307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KgaxCKXwOIlos19HVgBcYzf4uVbvhuNW1VHVexNu6qo=;
        b=mDXWs9S9LAVXxGYWg7uXG2ScVL7BC9IpaRvcqxs6HWp0Ih1MojyMKH8BeruvFWgHdK
         VrGNZQiTveZecH2wKYfPZ5pp4bUfwBhvtrN8h2tzNHrJphl+37QV2JDnnPhQJDwvnytZ
         gJaa5YLlI0a9mNxufg77o3nD4BHtvREHUP0w1+R1dndXr9eIfVEI0jy4BvzbrGHdFvcW
         Wvk4r8S4xgxUAJk7Mo7ALfnQOHmP6Q0l2HSs77OPSPjIZdE/QsrGfWypl+sSoiNSzZNq
         2X2Ir/Vfcw7QYgWdAq8/TVQza7POrYQ87mV6QIvzALZRaYA+CoFt4V2R9Vm2cSLxDjFp
         d1Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVticklcS0b5EEpjnA5k3HZ9cXQ4ttOcORrTmgbiacaejzrSKIkZXdF+jFoJ1NybL7p87kvgn03QQ5APw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCmvaXzsLb20EHnJwIjpYA8/YKMK7iwR0gVYhqdTe3U9op+7G0
	29i9gEgR6LO5h4ACn/wsRWfJYGuve/2URtWKsqg+JHstUjIxuvZX
X-Gm-Gg: ASbGnctDyzvNUaipgHlCM776NbLNCT7jaCI1Dr5ieFd6yEWUoH01WOmS6WgouTJ3ZwO
	t237HYMrAw5ovPNWKRTnFoYI18NyZFSNloKkKKs7HYJlc4fX7OEDrfGxqXbOdwdq+8z5N+Uj30c
	YGjNmMcGFcIS6Qu1k2c5vsZxRSe8KKbJEXPg6oml4sOP4/zi1Z49IK3eTbpYBVDcIU3QrKtdMeL
	FvwRukqqLF3hIj/gKuxsAPqmZZweFGNaGW/cDV5M98bIhdgl10pJK/cvDvOo5RD+KTSZAhspUx6
	8QUJOfB9ak4GoIKlbGf/7bMNkBoiU0tS1IgMqyeMIXnf+1xLIUF8K9X4xpjl3R+XQAfIWIjTsL+
	Bfd7JQCaN9Pv+XlVeTjlRSqES3Agf/wqX8eywB3Idm2oOLyHZJgQborvbMSZ8WfZXuea5ccUxs9
	M=
X-Google-Smtp-Source: AGHT+IHVc6Fk+YrhS4HlpEYRPoMy6wYmziWX+WTODzzhxnE0xaUTS8l8K3F3aATJnU07+Pf/6vdLeQ==
X-Received: by 2002:a05:600c:138d:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-4406ab98f54mr52685925e9.8.1745142506851;
        Sun, 20 Apr 2025 02:48:26 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39efa43bef1sm8273712f8f.49.2025.04.20.02.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 02:48:26 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v4 0/2] Add support for WiFi/BT header on Pine64 A64 devices
Date: Sun, 20 Apr 2025 10:48:03 +0100
Message-ID: <20250420094823.954073-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the BT and WiFi pins on the WiFi/BT header on the Pine64/SOPINE boards.

Changes in v4:
- Remove the pwrseq section
- Tweak the device descriptions in the commit

Changes in v3:
- Explicitly disable mmc WiFi section in DT even though it's already
  disabled in the SoC DT.

Changes in v2:
- drop patch that enables the WiFi module, it'll move to a overlay later

Peter Robinson (2):
  arm64: dts: allwinner: a64: Add WiFi/BT header on PINE A64
  arm64: dts: allwinner: a64: Add WiFi/BT header on SOPINE Baseboard

 .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 12 ++++++++++++
 .../allwinner/sun50i-a64-sopine-baseboard.dts | 19 +++++++++++++++++++
 2 files changed, 31 insertions(+)

-- 
2.49.0

