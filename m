Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7979DDB9
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Dec 2023 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UklJ5MQl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40b5155e154so19133435e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Dec 2023 05:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702733668; x=1703338468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e4Pnzm4bxmN1fk3GP72GEd90zQw6SBjTxtYWAmo9nW0=;
        b=UklJ5MQlizGxfkF1jWXFFQ5/oE1PciAqMyqIhg8GJ0HSe+6NPdOj1fgesQyPZw677X
         BmIdVTsBKw1otaaI5mx8adSz9jCTrPS1RfgZ3ylLwVs65r0agrzVZ/fmPRzQOiw77iSg
         LbZcKQDSbkvfWBnOSeyFfAZ98tladLShYUDFvy3uyYfkouuy1NzKyN+OQQYA1lOunDzZ
         5tkSsImPjP2stdxEjZp6dTVB2mCGhdXHb0077YvYe7dGklbOVEM9bbPsO+050X0M4Ndh
         aXpB4PvVcj1R4XYn5luK4AQ3ZMZxAmKlk8GXCJ/If3QFIBycP+auoScKip3Q3YEeY/QO
         0pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702733668; x=1703338468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4Pnzm4bxmN1fk3GP72GEd90zQw6SBjTxtYWAmo9nW0=;
        b=WZDwSjJ3dtfEJ39OYoIp3O7U3pojhgNG0O8NZ3B3JVs+Ies1Et3XWMJ1lo+V9mJTmz
         VSjfmratAtP0f1L8tTkziVGnrXGROZv5Zd8npEDOKQC63nAhmtgAUt960vMpIZC2I/Hi
         ++gHtHIaKRq1S3NzQmWBPEGuGenr9nmR9y+88RB8lGP6zOor3KsjmWT2neCqUlKZ9izh
         GRPOEceGQpE7ffyCMOblqtW/1EaN4XsHLdyOCnlNvsdVfqNuVKeFm5TZUsQJQNikXYgf
         v5df2/DgaC85GveqZ4wNv89KHrZCWJZHRJxOUu94AE4VVmYBB2TNDNmefSxkh8dc8xH0
         sbkw==
X-Gm-Message-State: AOJu0YzHEeHi+D5DRI8b2U3QEs0vA9B9sVK6JXakp7w3v8M1WScmrpGB
	zrSkRUaPNiqRZdIBVeWwf7E=
X-Google-Smtp-Source: AGHT+IHtl+U8thZppz5mNOff0+ApDzT0EKcByNUZ3orrNnMsfII8U9pYh68LYIjyCoPmkrtlwjcnow==
X-Received: by 2002:a1c:721a:0:b0:40c:61b2:c950 with SMTP id n26-20020a1c721a000000b0040c61b2c950mr2265466wmc.24.1702733667566;
        Sat, 16 Dec 2023 05:34:27 -0800 (PST)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id l16-20020a170906415000b00a232bf6045csm423629ejk.63.2023.12.16.05.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:34:26 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/3] media: sun8i-di: several fixes
Date: Sat, 16 Dec 2023 14:34:19 +0100
Message-ID: <20231216133422.2534674-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes 3 issues, which were discovered during examination of
occasionally non-working deinterlacing on A64 SoC.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (3):
  media: sun8i-di: Fix coefficient writes
  media: sun8i-di: Fix power on/off sequences
  media: sun8i-di: Fix chroma difference threshold

 .../media/platform/sunxi/sun8i-di/sun8i-di.c  | 69 ++++++++++---------
 1 file changed, 35 insertions(+), 34 deletions(-)

-- 
2.43.0

