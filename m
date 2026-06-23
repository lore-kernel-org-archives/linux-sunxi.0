Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FF63ACEEA
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 20:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247721; cv=none; b=uKGfijrrZWwCdm0vhdPLAiR2ZIrC8nXP62yjVZgFEUYHNEYvQlrfVLYn2CZyKGwwvAIL9gmGJclJLW3KU7c3uKAO+c7JCOIhubtSDRzFFbuku5EOs9cb7vvcygH/i234k4VUNQ5iFJ7+zsieE7H8V0o7xYJkTNNk+eO6Mvmwh8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247721; c=relaxed/simple;
	bh=keipto/oGSm9DO6JiPL+egMCOZdUpk6kCgz+ngJcUX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ORhKam+Joi1ngSRR0H/9bPLN8vLaLCrR3sDEM4dzh7n2fsfmMx19Hl19K1E7hmj5XQKhTgEx3GjwpPYbGg+MY6jnCh3OoBLL8t5xRfsFOZIwaqNzQqzMNxo97+NZugfuiqFe6keiKcYbNQ72bs3a8LZh0g4T8iIkvjMroimV3jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cs1AXYFQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cs1AXYFQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so2434305e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 13:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247719; x=1782852519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ/LUwVD4cMnF3/D7za+W6saFQ2jiETM71jeGNmmf3I=;
        b=Cs1AXYFQumNF+Il+FvLOLSZDgB5SF9CJq6gr1qnPpEbreQYhvUTkhlkJQKXDla30GR
         ZH3cogCSex/4GCRY01ZKkW3UOeItqjbcN0tBrwQL9/DHsjQbtJ81YlMdsnGmRLa1X9JT
         xwJcLAZbSDlMGOxJD1qZMcIf4Pem9dLekMDeHhDE2e98OQ9HoFg3OHjzHOC4z05cPq4J
         YmW74f1jktD1znsI7MO/HRu1ApZ3gjFmgCJARsM5T+DgyFve3WWdvuKFveRqnOr7rqBR
         W3x+L7YwpSaZ3jaRTxmqH2nM43H0q/7SOyQOTuwUFJKf6d0duBSe1LZRSyZje/E8tQbC
         8+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247719; x=1782852519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mJ/LUwVD4cMnF3/D7za+W6saFQ2jiETM71jeGNmmf3I=;
        b=FYiTss4r7qh30UmWrVIZr+rcDYumWpuBsNlaZbCar7B8XGnRYPmK6Vty3Q8Mz3ixAL
         g4jdvJZoxi6UZ7QYcK3wn8g4IHdicCf8GCcmtPmuzdK9BY74VFz9pQi2jtup6vuEUCy4
         07X8X3jg0M7AWbR9jYwFrvH24V4oW4gPK3jlO8uzVk27JzRDrdJzFeOg3+gT5aLTtV0E
         Jao//qA/diqTjFo4XOVuQACYKb/5JXqYcLGnnkD7vJWVu1aZY067JvMZ22BwOk0W0RSC
         T96vYWtPjv+GeS/0WoHTr4MYeeLj0KUQ2+2GvuWk0ayBDo94vyomqKVQGC4XRhJ0Y69C
         503g==
X-Forwarded-Encrypted: i=1; AFNElJ8aNUtvr7Tyl5BkXGQXaaATj9Kn67IenSabYwYtQgo/M/v0EKXgFSvx2SzLch1O4VWnEsUbZzpZbON/DA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyozBVquRvBnrnfg4YVrniSJnLJWt3BMGBdeghfNgFk0wBKrC0X
	dWY9w4qYnWQxz/zTgOr+HCYklUFJKgbIbv1FNHvLBFyHfPyWiQfjAhtq
X-Gm-Gg: AfdE7cnH1p+m7jJwmjehc4kfepS8lO1TIkEdSoJTWXiFUqVF1qbhMyShFjTffHaSbVK
	9SpX4ZeF48CLxOpbk+vTwT+2RcqtOKrwMr+HK6wPqm65fBiAaQbmNrW5ySW40tzWH9Wgeb/Hk8h
	WRiThHnUdcu6gyEQcRujgqSaFbczNYwaHhg4e73CVYuNDhesVLWqwSgj6qaxbF2LMK5ZXRt+YM4
	nab4idLUcNMcKNuHqfd7Mnr4i3QGahQdRcCe4YbY1GM67iv1lKW2u1XGE1FLTNGtEN7uGGbJiOJ
	Sss/FM7DdcOZM/z16ha47x9xuSg9H9y5Ayb3RaSl/zmmBVesKHvdexfXr+6OMgRkSI7vP2A58UL
	PHWVln6fLGqQgr5btbjNEGqop9vFlKx5moVfacVSMPVlbq3ETFYiWqItI6IqnXBaWYxTQFJc7/m
	oZg/XyrCxvYO5vBQqUPcN5uDr7wMQC4Gb1dw4YTY9TkA==
X-Received: by 2002:a05:600c:4453:b0:490:d32b:39d6 with SMTP id 5b1f17b1804b1-4925b37973bmr71981035e9.19.1782247718492;
        Tue, 23 Jun 2026 13:48:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:38 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v5 2/6] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
Date: Tue, 23 Jun 2026 22:48:14 +0200
Message-ID: <20260623204824.691832-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
embedded products as well as customization of embedded solutions.

Link: https://szbaijie.com/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2-v5:
- no changes

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6b9fb6a6bf0b..88225786e216 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -229,6 +229,8 @@ patternProperties:
     description: Azoteq (Pty) Ltd
   "^azw,.*":
     description: Shenzhen AZW Technology Co., Ltd.
+  "^baijie,.*":
+    description: Shenzhen Baijie Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
   "^bananapi,.*":
-- 
2.54.0

