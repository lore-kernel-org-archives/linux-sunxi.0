Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7604234E760
	for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 09:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779443661; cv=none; b=bd7RSsPH0g64ptiZK1O/LSRL+KChOq4X5pAy2foIbTkNF9qUdUwTSa8uGH0cVRo/EMI6wTPIbuLFe1N3o96qysWp6BhdcdnmF2tg2OFux+ezm3mRg1X9q5fTBywnaKNUswYbdXYkizzzj+fqfqGgI9avVl+QLpLEHX1VBv54MYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779443661; c=relaxed/simple;
	bh=VotcPBCLiCVTfNbIs9rB/f3jkhHrsiX3X+HPps7twDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jzwX+2Snujxd3/6tZhL5URy4BJwpYCqU6YSiTEfFQTGSRe6iBVGksQ4yb02G9041dn//w4adADN4mmrYDN5nmBEpHSAWE9mKcU8ULIqH3YEXuRXrTPddLIXSsIcMYu2oytRkdQG0gMLPDd0NsdEFu7rSKpWjIIvqMRsMgZNP/Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q/c77PAH; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q/c77PAH"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f8893bff3so3289183b3a.2
        for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 02:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779443660; x=1780048460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=951wht0+W1VQnnLt3d/D9/zM6BZV046xXYoOH60ZRZc=;
        b=q/c77PAHFNiYChlHzuQ9dYx4UnDlw0Po3BEo+p8QcXGby8ixZtaXQtfcwshLn7yyFb
         45j5j2QddDoLhLXFgHXM8vmvtuY+nAVRbAE76HeFonmPMqMv68BSQT8Q7F0tOyFsyuDe
         FSa9w6jQCf47rkdm11WsuR4ZWYVnXcDJd8BG74Y0vWeHN2miN+i1UrABF3SfmU2xv6y3
         aZReTU4tVq+NeYB7apjFetrG7+ZPevNJsBS/PtpG/3sZ31gXv5VoNatCZv42hDq1q8vX
         HOfa1qKILzCtG/Ic/1Yzx1/9wdGEhYX86kl/2y6iRrLL+hbqePdB+KHBze94NlhxkNW2
         eEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443660; x=1780048460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=951wht0+W1VQnnLt3d/D9/zM6BZV046xXYoOH60ZRZc=;
        b=Zk0hNKF4pikmHBNNtzKs+kv/rdqCvUS5TBbCn/pFYg9pvROJefinpEQjKNQKF4LdmD
         8lrftbvrWHpdSttzkkou/fFaM/NalguktabOwLJCQJKbihWaPE6OGy5Te002NMn55xH7
         Xl1avb4stGA6o+F/yWkDou3SuAYvMtPeUWzCkr1Lq4D9H8jcUDiYiif7PG0+r80LYF7j
         8Or0JJfYkjgFfSAxFVf7BuhIXJyP9XFuZJQ73nEpr/rOQhWHodKQ2FV/kJRb6kVt6Zkt
         NeorDFB+OEeMLlli7Hfbv/V4dBFNKimH9Urx81+9b9N8+r/pVYNgLqU9VnCCf2mMlcf/
         /q+Q==
X-Forwarded-Encrypted: i=1; AFNElJ++xGC/2babWxFWmRzYWSMKF7VDM0C6GOlovuYp8JUFOKgXcnV0Zc6qetQ9rYzAuptDcBy3aiE8AvKaKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQe6nJpuIkMqq9UORlnCykPo3aRCq0UlsqspiUzZ+Cfk66LnQA
	wHUaDsr2FXRezwaWi+EnpnC5QyLn6SPJob2en7N9jy45wqHkZhJSKqpQ
X-Gm-Gg: Acq92OGPC/nZnwTMKIAfZcB7xNVZ/n5ULjlFAtAmq7rRWZhb3/DAhdauYMkTjnaCGFi
	7mLKoSgUuC56GLeEA7Xzr3sFvjNG4XldxSAQMivkOxDSFnKv+l5Y4FRg7RoaSzA42yKzkR1A/zT
	nU9h3aohJyKAhcWwrgqAoZmrRAv5dqai1eVZU/eeXUxAOY/djgypdALA7uT8AubM6Uu4DuE8gm8
	tmndS8sNsrAbQQmvgdZ/LKdkD559anbDmlnx4znvaXTcDbAEQM++bU1qPxTJnzTIDJAMPvy4e5+
	sD3DdM591NfmvosSrpplKQ2Pz4jqnID6vIn5+6rxbEBv5Bwjz9r4C1CpA744Px8rAIC4gKNrNzE
	h9yi52nb9SfMq0GHOEKKKFBA4S56pu7Nxi61wQnxzlRLDGtccyd8SJ+vco7ZJi3AG43QAnBFU4+
	lI+FA9NeRKaH/I7sKaSR0LWzSk5iV6hn1rLgUBN3kISaArgwIxDaTTtlfDVYgn0064dtLL
X-Received: by 2002:a05:6a00:419a:b0:83c:5e:f647 with SMTP id d2e1a72fcca58-8415f5a64efmr3131038b3a.29.1779443659746;
        Fri, 22 May 2026 02:54:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aed7c9sm1757366b3a.13.2026.05.22.02.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:54:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: codekipper@gmail.com,
	jernej.skrabec@gmail.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	nichen@iscas.ac.cn,
	perex@perex.cz,
	samuel@sholland.org,
	tiwai@suse.com,
	wens@kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/3] ASoC: sunxi: sun4i-spdif: Cleanup and runtime PM improvements
Date: Fri, 22 May 2026 16:53:58 +0700
Message-ID: <20260522095401.72915-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi,

This series contains a few improvements for the sun4i-spdif driver,
including guard() conversions and ensuring the device is resumed
via runtime PM before kcontrol register accesses.


Link v1: 
https://lore.kernel.org/all/20260513105003.81880-1-phucduc.bui@gmail.com/

Change in v2: 
 - Switched from using guard() to scoped_guard()
 - Added runtime PM handling for kcontrol register accesses.
	
Best Regards,
Phuc

bui duc phuc (3):
  ASoC: sunxi: sun4i-spdif: Use guard() for spin locks
  ASoC: sunxi: sun4i-spdif: Resume device before kcontrol register
    access
  ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence

 sound/soc/sunxi/sun4i-spdif.c | 76 +++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 34 deletions(-)

-- 
2.43.0

