Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A099816F8F3
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 18:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713464184; cv=none; b=ZbaaQ0wUtFJSOFAWOORRY8tM5RH6APlOE+9BCbnaG3ivB3jLWLEEEzNHM8/6Kp+h96t9KUUbEO9q8fpqB/DmXRHT5qWj3d/l9MvBWwVtrnRbv4miHfrCgIuqqXLGx/Zv1ZUmOaQGvndoY0vA0pfwBs5M0Mi3V/Mgt+Fy8AR1How=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713464184; c=relaxed/simple;
	bh=rM7ydLgT4dhxTOX9ocCDrRxzHGc7n1/dpY8Z/thukMw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d9avuG3rhyLmty+qEWubaPQxdcFYuwTDlC/jby+V3lRtBKK8WENBvidijFpgILPWpN5IAfsY7TKjYnmsfeJasCW+YdndFKvhKvJycMSCVN3tDawEOiuMVqFX5BYi86Y33Uzz9mOrCfNTMhSZLIJJIVQJ+gYlQciTUvMCRw02038=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEumiVNQ; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEumiVNQ"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5ac90ad396dso596419eaf.3
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 11:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713464181; x=1714068981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SV99rxlHhyi/JSRdXEqT72fGeXEfSbNDTwwix6tbIb4=;
        b=jEumiVNQ3ZZwwNvx8CSomMVHRjieKEt7+0VoBRxpWO18DbUsS7EFm7gUamJbVZAxZp
         hBLvzGy6fVpgm3oX49A92ZzmoapepIb7dE3HB2Cp3/UUpd0qXcUsWEzPTErrRIAIXspD
         KvBFJx4xYRo67qryzaiTqrl0zfheZoxd+XogGR683r3ymhAoibao9ZxlMBY6OJdJ2g8E
         G4CInvJRMNh82K2icWel7W5rVaVX5+W73JsQJxpyFJ/Ledt3uZmGDriOar/plANOyKxj
         yPHm65oygLqFJVkTVxi/FQWZHkuA4ylddRDhUWjSdPsQ4GqalNMH7sqwL3CQNf4y0Zf6
         TNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713464181; x=1714068981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SV99rxlHhyi/JSRdXEqT72fGeXEfSbNDTwwix6tbIb4=;
        b=m7wSNRkiSpj4kuItpX+x4orjPkVqnhMOU/zGpkVpZp1xp1hsZRE9rD7kMUn+diVp+C
         h2k1z4dgSK+TeRf30J8mjJUPT9kJzkDc4Tnk7xzdf1WAXmKTw1Jfr/vDQZG1qUZ1eq5k
         FnhYAsFxST8vynufWk/6uZgi2dg1unhctbAYttrb4PfhE/uLI4MWQVTGX5W+5a1bS/AT
         WtF0gRs5sVGnGslN5a3WefCtqh7Z6bYOMOEdLoXrNyJdq17EeEP3lfDiGrVtXQ/A7P0O
         WtpYKP5kkJeTbXLlWazwedvR5+IqupWPR8W5Ax6uzmQci7fGQpVKfrNok2x0Ul8BVdBT
         TXlg==
X-Gm-Message-State: AOJu0Yy5doRcunvOj1NGklhHCZL8dbfmwfvWF8oWFCgsz52aXYtFfcTv
	fH1mVhA0lG+hf2IWRRUCU10ci6unr+S5lYYShw3GqX4gyc1wSUOo1FTJsg==
X-Google-Smtp-Source: AGHT+IFS1kPSUurGztHmlqTLJvnmqDDc4NnQZ2GtWSll6IKQJXFfYvLp77RHfSWNJCOsu2iTAXfcvw==
X-Received: by 2002:a4a:48c7:0:b0:5ac:f4cc:2c8b with SMTP id p190-20020a4a48c7000000b005acf4cc2c8bmr53923ooa.0.1713464181668;
        Thu, 18 Apr 2024 11:16:21 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id dh4-20020a0568201e0400b005aa77c0fe49sm483419oob.24.2024.04.18.11.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 11:16:21 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	tglx@linutronix.de,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 0/2] Allwinner H616 NMI Controller
Date: Thu, 18 Apr 2024 13:16:13 -0500
Message-Id: <20240418181615.1370179-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Allwinner H616 NMI controller, which appears to be
common IP with previous generations of the NMI. The NMI is required to
support interrupts from the PMIC among other functions.

Changes since V1:
 - Update dt binding documentation to collapse multiple compatible
   strings into an enum list.
 - Added note in commit message about NMI pad exposure for the H616.

Chris Morgan (2):
  dt-bindings: irq: sun7i-nmi: Add binding for the H616 NMI controller
  arm64: dts: allwinner: h616: Add NMI device node

 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml | 8 ++++----
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi           | 9 +++++++++
 2 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.34.1

