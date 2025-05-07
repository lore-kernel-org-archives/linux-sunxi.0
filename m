Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBCB28ECDB
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649360; cv=none; b=fN2TNGhzU79G4G7yyhJsRtWeYv9AfCPS4F5YZF+ham700dNCCZoWlSBY2pif3Bs+hKM+j4RWEgAlmuLPhidhmWNYczTbG8tPpF3bTyhIWMmnpZfDG+96bbyw7KHuLCSIUA7Gc5DWlIwPardnpqLtRrXyu6zPTCYDY8lqxRvrT/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649360; c=relaxed/simple;
	bh=PMsn3/Ay9JxV3iOA8EPMcvBM4yoVvPyA5PJfG6KjXOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLYqUGx16S5wK0w0+KNyw0i5TsAFu7+HLvi46Lbw1n8K0LQQmIWy3KSfFgx4JxYLFQInsMxpDWBeI6OCnzxG5tO3hN/wlCH0waURKrmPdT6lApQU2jWCVUy2DTIyLT1fYBOZfIU+sbQiREsbFiEcMVYUfmJ+gDs0KCVOE+LfM5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMsoz5v9; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMsoz5v9"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72c7336ed99so69121a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649358; x=1747254158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mIGvJTufAsSoppe4rs7rmEWLnBgi1PHvYLOO81jKxw=;
        b=WMsoz5v9acPaCPoK1s8Q/Wp83lHtKvAxXhevLJ8l1FI1H4ZRSe2UQq+CbmL0rmicNc
         8cLT/M+rvE2s/syTKHnuTCdeZ8XNn40682/ZRVYHKAKj7PU5+ADUIGqGuElsPT23S2OU
         1AaZf8Ws+/Tm7PfoMPauUGW/2hDVEM5axzhixydAdnDQX7GOgEV85JdURj6jsJjxat8R
         pYbwEQbkagEeaRqoCjFtLtwWGAdadgn/yQn2FEzKPjoKYo2/M1zOPQ41qPDZnffcVwoN
         m77ygiq+C9Sh0VnGKwYKrV4WZ4tHNf5BbT+6wWNzVHuI3gLJLQI4ccPltAMEhpNUBYkQ
         hJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649358; x=1747254158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mIGvJTufAsSoppe4rs7rmEWLnBgi1PHvYLOO81jKxw=;
        b=YnzuY/uBxPgk0tsB/zi0GZAQtypHWvXl0xvoETjgRUYQugu9nI3cuHi89HbrC6sHnY
         sNUpLXJwfUCxR/e9CKvetmCBYhj9K8wuP4ZmXcpBwAd3T89ojJLrWJqgiNK9gLSKKdGz
         dUSNCKeKMUQDkYhL2yWX0zIYqoM5sGg5PuDBh0XqE9An1qerLXlIOBlBnCn2kqy6OZtQ
         sgNpri6smQ65E1U7HN3K/vSGYSfCTtb2wgEDgdBRIgCXjGuhGBvmDnlcpuSrmu/KRrDj
         qBBZOhVYSn+yiTvX4hfek8D2JNoNqEvC6NkaQm5LJ8Zzys/Kv07IuPw51K1bI+wjN925
         7ESw==
X-Gm-Message-State: AOJu0Yw+jjh48eCBmCh8Kp6xWclkA4s/s4z9mkIoI8wN1GYYb6vrzEN8
	ZcsmUscoTqdZhHQUzkxebwk4X0R3BQ7VAAsaF8bhCz42Q9lwQ/z5hV5KbQ==
X-Gm-Gg: ASbGncsghQIZGyMQNKnDjBB3k1dMFZrMCh0KbVMOnc221M81J77DX2Ph7AHciX5Tmkl
	fXq57j5z05vAv7TZ+dUak21DoIIx85StJiAImsasLy3Igk97y6gOiDDK/dsMSxe5WB7MTpiylc1
	XuSracwT8gQSsC7Xxyufde64BwzdcivATqRui/0cSlX6kRVrfELZoT4oJIjIxSDRCKIxqnzrbdj
	bs9XQ0amszltMaOH6tDcrHt+fzkySNHdXWQMKA14GHW6FTAfsxiNDkl1R+mtKXvdttCEdy0boqc
	U4kysTFqgVVKh031Fwt0hrP72Ep0k6OvhkYvhu6JnHuD7CEsH9ywZA03dUr/
X-Google-Smtp-Source: AGHT+IHcSoKFAVM889xXWDRRESTkmKZwmdTzBlBWvS9Mz85bqYtY6rkC9bb+3ND5pNYa+fTL+SOn3Q==
X-Received: by 2002:a05:6830:d83:b0:72b:8a8b:e032 with SMTP id 46e09a7af769-73210a6eae5mr3335106a34.2.1746649358256;
        Wed, 07 May 2025 13:22:38 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:37 -0700 (PDT)
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
Subject: [PATCH V9 14/24] dt-bindings: allwinner: Add TCON_TOP and TCON_LCD clock/reset defines
Date: Wed,  7 May 2025 15:19:33 -0500
Message-ID: <20250507201943.330111-15-macroalpha82@gmail.com>
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

The Allwinner H700 exposes RGB and LVDS pins as well as a HDMI
connector. This requires additional clocks for the TCON_TOP and clock
and resets for the TCON_LCD LCD controllers to be defined as per the
T507 datasheet (which shares the same die).

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 include/dt-bindings/clock/sun8i-tcon-top.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/sun8i-tcon-top.h b/include/dt-bindings/clock/sun8i-tcon-top.h
index 25164d767835..2a12d047d2e1 100644
--- a/include/dt-bindings/clock/sun8i-tcon-top.h
+++ b/include/dt-bindings/clock/sun8i-tcon-top.h
@@ -7,5 +7,7 @@
 #define CLK_TCON_TOP_TV0	0
 #define CLK_TCON_TOP_TV1	1
 #define CLK_TCON_TOP_DSI	2
+#define CLK_TCON_TOP_LCD0	3
+#define CLK_TCON_TOP_LCD1	4
 
 #endif /* _DT_BINDINGS_CLOCK_SUN8I_TCON_TOP_H_ */
-- 
2.43.0

