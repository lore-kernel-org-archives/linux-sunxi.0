Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545D228EA51
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649350; cv=none; b=Nja0wt1g6Yc8HXPtlZpbR6+VF2w4L0M0IujoIk+v2695V56dGggZo3lM0KXr0c2hykEuLrg9nyBrWvbFcW2DE8Rda6HBvTN9o0CqMX/HCV+LkJxgG9pHpuLPsLALXGhcawODpxwz95jwoZMGdYgJKw/5hjToA5vTjqJauk8CV0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649350; c=relaxed/simple;
	bh=xsgJ2zKW1s6unCASARfB210Gumqt0eW6xXNMAN+uJvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HnRfhxOqsAPz7kul/WCGm99HHBMHkAgXzOL21mKs6WBPqTdWSzv/IEYtu2tnUfZrrZ2QCmqrfGIhR3EwhCN2Upz1r2lrTddPqhkbARwxEjtWam3x66SF5Cn3fZFTIZmZetuSIV+oQK3YMQy/OSceov/6Apm4OiwEt+5j93Paq20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ww0iGp5V; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ww0iGp5V"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72c47631b4cso135747a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649348; x=1747254148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wCsPI37yI3kW2PZlC399eWtWxNv3NVwnKhYRGNZB4g=;
        b=Ww0iGp5Ve0Z00g+E41JJz9uqWVJzN20FLprb+ZD1ZOLMyfPKOYVDIdLpoR7hhNgvl9
         yas2nGT3tbqFaTYIbDJhGJpeVBw6x1VzUjymB+y2YDYZTy33+oD7jV4kqTeqy5SFYQgT
         mIrYEg+76IB0BMvwVRWKAK+0fV3RKtTuCiAi8Rz7pU6sEgn1KYlIghVQJcPY+TlKD/O0
         411Y5e3DsrSHUL7pOfmWZSriBLgvzvAyJXDqraqrkV8+6Qf3TtnDcSlcCVjLl+d9t74/
         3McZ7LoDRsy0Y3v2JvivkgfYC4XDIt1MWT39ZhqvHeJZjW6FW5jJOj5U70WwXzt7CyiX
         32YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649348; x=1747254148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wCsPI37yI3kW2PZlC399eWtWxNv3NVwnKhYRGNZB4g=;
        b=v6EkUp0vZrrQ3ypQNbcaXo4IbboiyWYKwXDMsdvkGFIbegdnsZmABGY/TaItNIHZ1C
         fDRh5m59bGRNBaCfG61z1APk98vFTOQthOQ9mdkRqRmCtE1NC6831b3KQWNbYQSr0guB
         ya/cAfUWSXwh3/nJaveUCW4Oa8OpRwLxQMv5ZLBsWqQAX5XSMJ1OSw2u5LsLMg14K8XG
         MJ5Qu1kMd4POlY4yV1TiWb805AVVxcFPGCgpZy0pcjVWVp7nf0HtZtIR0bxAy2/24UeK
         f35I+nLa0YIDjK4I5hi5mes/0e2wlMW/t/SGvJqJ8w4n5YGzjFjqgdBCfHgWUPoLYq1a
         P7Ug==
X-Gm-Message-State: AOJu0YwSM5qJ8INHsp9jyeqC4wtGhF9aSantyxpmD3NZ622bdYkzQe+B
	wvh0lr7wksB3ayDKN+wu+yxd3IG/smdDcQ3xuMXP3myPPWjFuStnAiB56Q==
X-Gm-Gg: ASbGncssJIxNEHjBC7gVag44urMtYjpuODq3wWhRd3yJw2tDLhDtK869uPYwsWyE2vX
	9aBKleOJgErRMEz8nskrfnwCvpB96zZU3zZx2xuOtaniA6NcYdN442bZA22GD8LM42LW6KRlIXX
	qLT2UWV4Blm0hik3SPtk0z+Zv0ok/u0v9W2ZZEDsOi4cOFNvvZ7eTBfRC76X4zMwMPlB5T95JKK
	wsXcLQsy7ArPb6muceFaQ+xVcHHWoLF9hY0kTx8bhE4MinluUzaM1LpszIt89PoNHuA9WIHXOIR
	bYrQpvaHzUDW/sQscOiy+C5ClEAES1ehErTMAZXYXVis5ZegGiH0vCxf7nOA
X-Google-Smtp-Source: AGHT+IFytOVfXojJmCR6jJHFmx4KGJn78CqT1+wKBNfjDiJd69/px5acPIOn7PhMAV+YoSaRnITWVQ==
X-Received: by 2002:a05:6830:370f:b0:72b:9fb2:2abd with SMTP id 46e09a7af769-7321c97d487mr523435a34.20.1746649348140;
        Wed, 07 May 2025 13:22:28 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:27 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ryan@testtoast.com,
	macromorgan@hotmail.com,
	p.zabel@pengutronix.de,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Subject: [PATCH V9 01/24] dt-bindings: clock: sun50i-h616-ccu: Add LVDS reset
Date: Wed,  7 May 2025 15:19:20 -0500
Message-ID: <20250507201943.330111-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the required LVDS reset binding for the LCD TCON.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 include/dt-bindings/reset/sun50i-h616-ccu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/reset/sun50i-h616-ccu.h b/include/dt-bindings/reset/sun50i-h616-ccu.h
index 81b1eba2a7f7..ba626f7015b5 100644
--- a/include/dt-bindings/reset/sun50i-h616-ccu.h
+++ b/include/dt-bindings/reset/sun50i-h616-ccu.h
@@ -69,5 +69,6 @@
 #define RST_BUS_GPADC		60
 #define RST_BUS_TCON_LCD0	61
 #define RST_BUS_TCON_LCD1	62
+#define RST_BUS_LVDS		63
 
 #endif /* _DT_BINDINGS_RESET_SUN50I_H616_H_ */
-- 
2.43.0

