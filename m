Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660D24C79
	for <linux-sunxi@lists.linux.dev>; Sun,  9 Mar 2025 06:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741501916; cv=none; b=OMW289pa0C1Bqx659VVJ8O7Q865cpn69nKclEd5al+iMA/1Pd2ZKhLH0x1yiimInDDnb6pieiQs2iCIimBZM5eMrmGG82+Xwi16xHeBhEXUJQAwfGaz/tJ6NmeCQ2kahIU0QmjBTmPySmR0YKNHOmxjNpM5Umc1sXduLtDZf/ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741501916; c=relaxed/simple;
	bh=PkD7Q0Z5HdEbIIEiFEu8Yq1Z24tz6sC7oUS9VXr+niQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u3YMFNCyWhuQ3O80M5U+1oW4WGfpVLN4Yqg6h1hoNR4BT5FVakQYDUtnRSt9O9AKCMVzp9IE8wHzCRBApGJUg0Qr737vbKGhWrTXE+3KsjZssFACCoZo2i31sSpJ0/GU2HoKyQsmZPkFFcVmMkp/i6zgzUh/tdzE+shgNb33jiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3NzFBgd; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3NzFBgd"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaec61d0f65so654836866b.1
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Mar 2025 22:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741501913; x=1742106713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RccTg7UJlyDlzTuf/rPeRlSiEb/UmdPN47ma/gUixNk=;
        b=D3NzFBgdrJNlO0beyiYi/24u0NidNd09D7W4gaMVAgscA+h3yZxIQtMaHFs7BNqmKY
         zHwre2+7MV1DytZ3i3vfwMCPRHZbQZ6tFX6rCzENnI4cS1S1EdNmMs2amDfVG0V1xDZq
         YmjuRzSWDEjA652QB8Pv7xMt2H7lSTER6nK7UuUl1EQgTpvcJJ3l4i5I3/lcaxEInRKM
         faOjM55RkrXp2fuI7ybaOOVYKgbwXJXjlVcKMr0mRleLV36AVKOf7zt4vA4dfFV1EJ8y
         x8ycuKdnx8xSz0CRYQLYgrCsEqNjFdL6P8/K65RNUhoZtOfWtWwt9JfnDljcflqwKWYK
         LD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741501913; x=1742106713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RccTg7UJlyDlzTuf/rPeRlSiEb/UmdPN47ma/gUixNk=;
        b=SkQFBAkUfDWFCIToYYcdUwBaq25VYFF3OjHX/kjAHTb3pmynMYoQxDLE7c5HuFSAa7
         roDx1rEGkXjiZk4t5S+pXzhCb9Wgd9xxt5Z7p8vXnMJF1CiAm0njTnnWX5vnFq/OrRVj
         yjVsfEn8s3/koMNtZYa3BdHi3BUS5Tll1N9bAdPZWGq1QqoGBE6Bvfhn4Xys9hX1reW+
         r9qFQWdF0VQ2IhyUBFqBqYnsW0bmlcmzIiMwJV7e57f70C2eKeDkyCkkx9NvFTd/+LRx
         U8o5rL88lm36T7LQe5Zup00mTp5UxaloNWiacgNMhvUOtoV+gTgWYNivJqV47Q7TrFz4
         jW+g==
X-Forwarded-Encrypted: i=1; AJvYcCVUoB2aOEPZAI0b0gwfIpiXIVVHo5LMKXXtxbXS3jDe/rugmaWmx6yCRgSw4fcLmm4c+XKMDn6ewsJx/w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzlc+bJM1Ex8HH0RM2CvjU/fJvEOHh9GMTZOJDqIcuOAl7l6JxT
	vIjqVcAOBO1GKnSG7Ki2f/vR7bf61/aH1/tIEpTJtc54ztB2kqQO
X-Gm-Gg: ASbGncsSTXnxnkwsxNi9JM1lVn8v1iWwZC7FdiTgfhKb7w9ucA79Uxf1tKIf+SrtQyP
	bFNi/NIN8WghvINAaj7MXiX5kFPMbdHHYbst/KQ0HCdApzYISQNitKdIVuifuy7YWnRwap7mpKc
	jvCf/Ct93bu7VLyZjuNACqHh3A+ZxQ2IRXhIT54iiW+WJjT8puivoTQ3GyxZQ7yiTmZHFBNNN3T
	kjiNxG+LdgDl9mg+CxcDgo6rJCKjmJLSkyeZOB6vRGUQmMo/hrJHGKEhuSS++AsdWOJMYKqg1QT
	sryX3+7E8fHv1Gx/njeXX+ypSzYuHLB+ymJ0Orxio1geQBhT0FZsJwv5SFehJp8w
X-Google-Smtp-Source: AGHT+IFJP+ioWICcQWleXjUCazZRl9S43DXcHVf0azvKLfKrDxoAZUO/9RqcSrXzrIMCa2sJZuCRjw==
X-Received: by 2002:a17:906:cecb:b0:ac2:8118:27e7 with SMTP id a640c23a62f3a-ac2811831a3mr354340466b.50.1741501912282;
        Sat, 08 Mar 2025 22:31:52 -0800 (PST)
Received: from localhost.localdomain ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239438fd1sm552978766b.18.2025.03.08.22.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:31:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com,
	trini@konsulko.com
Cc: macromorgan@hotmail.com,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] sunxi: h616: fix DRAM size detection
Date: Sun,  9 Mar 2025 07:31:41 +0100
Message-ID: <20250309063143.62859-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I got multiple reports that DRAM size is occasionally misdetected on H616.
Some analysis revealed that issues are the same as on currently WIP A523
DRAM driver. Namely:
- size check might test outside H616 DRAM memory region
- only one dword pattern is not enough for memory aliasing testing

Following patches solve these two issues.

Best regards,
Jernej

Jernej Skrabec (2):
  sunxi: h616: dram: Rework size detection
  sunxi: H616: dram: Improve address wrapping detection

 arch/arm/mach-sunxi/dram_sun50i_h616.c | 74 +++++++++++++++++++++++---
 1 file changed, 66 insertions(+), 8 deletions(-)

-- 
2.48.1

