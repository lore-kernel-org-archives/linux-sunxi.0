Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCDA4AEE0
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Apr 2025 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745078459; cv=none; b=bMRmPXSQnww5z3hYAh6+ZpZIrNSFpzsCjLOlQGoYLn2RSEekdxcLIRVNfSEnx+1eGt/s73O5NJl/0qkZOZYns3r1HAmjlKBzxRfOONCYCjTeqhL9uU10MmKnA15iu3mF6BGkkaU+bTjBXhpdlGcDFcARmk2RFQCcwtpdSJpbPrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745078459; c=relaxed/simple;
	bh=rlh4EjIVhJN5IBowA7mWxMHg/irPG8SmD6ZGXExhwkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T2NDgbKThRyOJVDL6JhgoB3BNyesxrKQiP/MBE8QHNpEjm7VzeBQ7lZD+28hmOs3pXtk8HADRZS+n/lxP+aVS3tbLwKn6FLiL/ayCb9POG/+iY/ZLNQBUpZ+fF4CZ83+gyIjigh5OlvbpZf3Rn7ZLawAjEdp0dHObhf/DTOdH0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eks8fWKw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eks8fWKw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf257158fso18708195e9.2
        for <linux-sunxi@lists.linux.dev>; Sat, 19 Apr 2025 09:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745078456; x=1745683256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W/fbFejZy4nIPoWrA0dBRfXvnbry7Fz4n31+Xfuj1TI=;
        b=eks8fWKwqq9yR6RgVtEj1Tc6hbBoidAXWFGvHjgUCre1YJ3IpKW0RzSb7JBitRfH08
         Szk1jeGvM3EOJzTqE9ZeOJzGxkksQWxzVrkYbFpOWCyr6FzfXphVYDlBWJHS2KXw8qB6
         7nNkLMACOgkJlf2z0NfV30fSglk4V/qnkyH4NnfN6rFbbN3ockVXnCFyPNLo0WYO65sx
         4aVHtN0P+6p0pWwa/nwwFhtapaN/qSxwc5bZJhSSslCLHCtNw0iVd+TFa76xLHQD48s9
         iyVaiieJiPkbQFm5Mo3qyXwtqWpq8wppZPSYQFf7mi8uDHVMt0Nnm7CvbOC45CiAIvdr
         9KTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745078456; x=1745683256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/fbFejZy4nIPoWrA0dBRfXvnbry7Fz4n31+Xfuj1TI=;
        b=NnxZoQSOOqH/w0n1MPoWyWGEG01V30JzkcCTR98gCiCihSjtyhfUVpH1GFL7piZE8T
         p4jROwLN0Coro2E370TUp1EftQuSm4wyMkV3YdrZ+B+c3ALrt+H5OhtxAPhQN0D4MNU6
         NjQf0No41kUa5YgNBrHko1sEJvjRIYcrYmdCrqhnzo1w7WJIXL7uWNYAM1pf6RUQbR9a
         3nlXyhlft7ZJ/MadUMN14wemAs6dDwhRvRCHmk4PA19SYZ2/vuZ/xZkKTMlUjpZMGTDY
         AByU0RIxulWSh5XhVjZWE18iR+E5gJMBBqLLanHXJCQDPLBeorLkmLIS1B9XKB4hiw8y
         yvvg==
X-Forwarded-Encrypted: i=1; AJvYcCWHPY4dxPsbezqFesLNvORnnJdvdiPQfoGgtaNtsZrUf0aptTkdQuvoCxrhBSHtj+L3sHWwmiI9+5zezw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVLtCviA3GizPNXZXPGs/N/TlGicQHoXhmTQ/Aa7u8xp3qQljV
	HiOXcEvg/oSIyQXLBJ8vaep9lz594mgoktogj1Ssgg7GDf60AtPX
X-Gm-Gg: ASbGnctjtOFbyYC8XMfSrhwrMoVKgSIn9oSOX622P55QdEubtyncmIuJrml308YM82D
	WXCEkPEEKju6fipYU16kH4DXKqmK8jfug/aOB2vFAi9/+MoNsjg5iAUbgDQI9Gy4MZr2o1akD16
	4z9xMW08QKBTgg8Ftck0c0n2gxPR1us6qpQ5+cYRnsp570mc+V5sCtJuigBmbCHXevTzhAy7Ott
	ricZkZqTQEZKM8lrvUBvHuxhCeyNGIlbkTV43Pf6JE3P7rOw5HDU8pR4VBPu31WFhnErHvzLk9I
	96fjk40gZY5v2isA5wWPvx7vzrHH/+kchmn1GsI37yahnl+zx43s9tSu85uFE3nC1NkNA/yk1U9
	ZM6En2YRpJGOzC9M1WXYGgiOjWyHWK1skf7x6EJjdPF4f70iPim5+d8jDJ3bjx0xrx4VvD1KQZA
	w=
X-Google-Smtp-Source: AGHT+IGnC36Pr2Pwb4ykt7IfU37k/BXh1PqT9qkdlZ9ToWVt+IpsfmlkELLWVuksNL2ab2S/sOLkPA==
X-Received: by 2002:a05:600c:1c07:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-4406aba5a1amr65142375e9.15.1745078455985;
        Sat, 19 Apr 2025 09:00:55 -0700 (PDT)
Received: from cypher.home.roving-it.com (2.c.4.1.7.3.6.4.2.a.a.3.0.f.c.2.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:2cf0:3aa2:4637:14c2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4406d5acdd4sm65136215e9.14.2025.04.19.09.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:00:55 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v3 0/2] Add support for WiFi/BT header on Pine64 A64
Date: Sat, 19 Apr 2025 17:00:45 +0100
Message-ID: <20250419160051.677485-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the BT and WiFi pins on the WiFi/BT header on the Pine64/Sopine
boards.

Changes in v3:
- Explicitly disable mmc WiFi section in DT even though it's already
  disabled in the SoC DT.

Changes in v2:
- drop patch that enables the WiFi module, it'll move to a overlay later

Peter Robinson (2):
  arm64: dts: allwinner: a64: Add WiFi/BT header on Pine64
  arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine

 .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 18 +++++++++++++
 .../allwinner/sun50i-a64-sopine-baseboard.dts | 25 +++++++++++++++++++
 2 files changed, 43 insertions(+)

-- 
2.49.0

