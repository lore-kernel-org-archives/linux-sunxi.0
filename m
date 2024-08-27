Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC73FC133
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Aug 2024 21:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724792485; cv=none; b=cvIitRAGPTSSWTHJrTGZeGuAyR+hbOesxK8q10MC9jafjLA7dZIAwzu3hREWOdVbgJA1R0JEaY7uSwFZiU598a+7HExBq9V9vZ5l7lAvEIIhApaSIhUY4D91K0/oxe8gYJ4CVmOnNkwtBQC2vQLjjt7otNla3B8eDU35gEW6v9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724792485; c=relaxed/simple;
	bh=usWNg3YCPNSMfYd3cIsqzqUm/OvMLGLPE61i3N326PM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i60hH+xlvBljMQw6zoMNQtOz8Rs//HOzSyiexIeW0ykGLJch9mCKWJrSi2p78wQwqEN7wfBEP93DG6GKcspMbQPEuYPWpgow5z8rhYocxPQ/2EAntMZsdJP938uBJ2qzSKzB8MsIT1KbRzAPyVNbHxXtMRoMPRQEwyMsbz+E5w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOfiS+xO; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOfiS+xO"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c0abaae174so2843763a12.1
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Aug 2024 14:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724792482; x=1725397282; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6mF59s4e9GQ30bjpcbJxfb6SjZW26Gx1uj0s1ti4M5I=;
        b=LOfiS+xO12wsgnKh4lzB/zbOa+8blMIriwZg4+4L/sYkuhzSz6MuzCmPQ038rkzxeK
         ZHkNqdA78rjCCEQMzP7atzjHb/T4gBxUFm0ur7Y20sdw+SpXIiMHqLrNpzCUHO7W5+/b
         QmgVeH5p9aqHA/lxvzGKQrQH0wnF460Q5OlTyZ1j9SH6sC4jY2ac/ZwmR3nVGUhU2Eqk
         0+r4w1IcdX/lkgIpNuS6aTVG6hQ/5KlfviEE9H8n+pym+/WdUJNDtNd46YSR9mzxlwvI
         2PjSZ+BwJPQHGUXOkHF+gykqTrqKJPg/88mRSQpW7KW7henkre26oBr5jk8LIwoaxaSb
         oK5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724792482; x=1725397282;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mF59s4e9GQ30bjpcbJxfb6SjZW26Gx1uj0s1ti4M5I=;
        b=EnMQ6KjAspkfbB4tE3rf5tG4s+h4oJuyHAIpgXvMYxLPLm0JqSEzl2OPyaGjYvSKjG
         H6qQEoBPSKZLfP/7XcP9xcWB8crymvI8K2/pCdXoc+e4WsDha77clBf0HRDiHKQXDWC/
         DCKwcLvXfb2l4gPwPh7duPUij99MZZcULIyypFHpiI0585KNlmMiBQNgf5nxhQBX16Lb
         XLz3w7PhFiapvlCiPaq88LyipJgk7/OWfNAc7cks5vOEqKkpV4H48tLBEbCiAIrOmVH2
         hHLxUDgqhrfAGmqr6hOpG9lSa/8Nnl70e9vuWY+JOiZj1ZlvIdsZkn00BCbocupd5iOw
         LMBw==
X-Forwarded-Encrypted: i=1; AJvYcCV6N3mY4C02h0iZc63XWX6vCiZMTTXDlu5r4SPX5flXbq0YwYMJi7cmxK/mF3fFyVPWNE/fHPMSi/02Qg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxaDNXQi4mcI9xR+Ov/BlQi5RU+WJPwQOi9y9yXmtnQ0PImqEka
	ONE4h1UCpQw4TTCHVNNgIVXjhEZmlWVVzkKso3AQXZphUM8i+Lg9a/iUv71LwyY=
X-Google-Smtp-Source: AGHT+IHeAYIq8ZK2b9C5inDMUKXAqiguCU5CEk35GI/I03s053vBBofOZLle6SADgKilXe/GFeohOA==
X-Received: by 2002:a05:6402:1ecb:b0:5bf:8f3:7869 with SMTP id 4fb4d7f45d1cf-5c0ba2b8b7emr2727653a12.21.1724792481486;
        Tue, 27 Aug 2024 14:01:21 -0700 (PDT)
Received: from cleve-worktop. (85-193-33-82.rib.o2.cz. [85.193.33.82])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb1c3114sm1405835a12.13.2024.08.27.14.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 14:01:21 -0700 (PDT)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
Subject: [PATCH v2 0/3] Fix regulators and assign them on NanoPi NEO Plus2
Date: Tue, 27 Aug 2024 23:00:42 +0200
Message-Id: <20240827-nanopi-neo-plus2-regfix-v2-0-497684ec82c7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHo+zmYC/03MQQqDMBCF4auUWXeKCVFLV71H6WKMEx3QJCStF
 MS7N9ZNl/+D962QOQlnuJ1WSLxIluBL6PMJ7Eh+YJS+NOhKm+qqW/TkQxT0HDBO76wx8eDkg11
 TKdVYVtoSlHdMXOaf/HiWdinM+BoT079nsDO43w+2qAcaJexwxkWhwtbWru3JmJrcfZhJposNM
 2zbF65nCeW/AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724792480; l=806;
 i=cleverline1mc@gmail.com; s=20240824; h=from:subject:message-id;
 bh=usWNg3YCPNSMfYd3cIsqzqUm/OvMLGLPE61i3N326PM=;
 b=zxoLESLLq24R3sH7xZvnxDTPC8MqEWSAzHNx/zAj1mXEbGLtRE4nQnz+MmEA4+ixlxw333hPa
 WI+S+UoeoChC7utoYf9tHcOJeQ1xTiSN01kiF1O5DZfUnIGfThWSjqE
X-Developer-Key: i=cleverline1mc@gmail.com; a=ed25519;
 pk=CQifx5FUgTQKAoj5VCYrwYHi235AkXQ5yT1P6gkaBxM=

Many thanks for your feedback, especially from André Przywara,
I learned a lot from you and your kind words motivated me to do a follow-up.
Regulators should correspond to reality (schematics).
Proper regulators were added for pio and r_pio.
Added missing regulator for mmc2.

Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
---
Kryštof Černý (3):
      Fix NanoPi NEO Plus2 regulators
      Use regulators for pio on NanoPi NEO Plus2
      Add vqmmc-supply on NanoPi NEO Plus2

 .../dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts   | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
---
base-commit: 6f923748057a4f6aa187e0d5b22990d633a48d12
change-id: 20240827-nanopi-neo-plus2-regfix-b60116ce12ca

Best regards,
-- 
Kryštof Černý <cleverline1mc@gmail.com>

