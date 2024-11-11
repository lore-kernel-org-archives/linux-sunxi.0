Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9667C39ACC
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731344166; cv=none; b=flYN3ZxoXbAItqH0HFLMuwRqBGuhZ+yw03mV9EJX/UIs4JOErEJRgXI+XPnwLKQBIk6LgEcV76LBq8GdaJ/YQgxDRuBVQ2ZZwtU/0Dej6TtVNOabJcwjLK4WL8jk52yVTZN687YrU+HePzOvp7hT9hi2dWTmM/LY09HVOoCN9bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731344166; c=relaxed/simple;
	bh=K92yUvKG6bNkexeKvclLDYbTcFbU3nDHCbBcWLUUUAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lr8tTds38liQ16xcTeXmkvOxyxn/pwE92q6Ga1tUd44KTqx2ZZLeAhmB/M03VU4c/IfrPcHtCm/frP5ruQ2w5cv5UeMjOw9vQVUEsuvIdmUQP6rcOT81iV4lRklW3c0HzL9bmM+D4dZrZTZclsF5QPLAP4aZ+KTcnBMJAqmmF4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RB7TzS09; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RB7TzS09"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so5270475e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Nov 2024 08:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731344163; x=1731948963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Exk6mmiqQi1A5uEjYEtmgEMregcS5xH2lmr7GxpUfF0=;
        b=RB7TzS098CO7TZYsWShb99XB3XpvtEzSYSNauXo0xxOAmx5HH5CnNzGUHO3fSSnt3Y
         DmNBLgBx4WFO/m/2G3HOjxe3th1IAi7JBHekM05V2tjpBDLxmEUqidCeh9xSSVIZtohj
         NTFLQgg+01bTLR6yfN4F3bM4gcW0nrKOx7fnLGpr9vW4Tx3D9X3kbnppC6LijZRACdUI
         dcVuzevHp8WxqMIzFvnEhawgygp2O1bfahicXwzsmDKPhxiQ3uKhowB2DyjVq1dnV787
         A+5GTaooj38Jc4Wv/LoCZZrZIGDbZCvq73k6WnZVtek4jf6ttKgnwRYixD4fF1/J2Ysb
         Arlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731344163; x=1731948963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Exk6mmiqQi1A5uEjYEtmgEMregcS5xH2lmr7GxpUfF0=;
        b=rwb0YTqxGhbtzV5lcQZSIDdglLqI4YcODFJbMd5oi22nHErB3Txsk4YZ8AG7MiXIMl
         aAnBwDL73yOS867SoJHWaxdVkM8SUp3YfDL6A7xpaUTn8FBpP+RPBL2MajTc/bsTTa3C
         7XyB18BKgCd5586RmwzDHXZzY7WVkQUOvFNlK2QMC0kZwhmP70L2pQN9J1LksTMRN86I
         WzFMBjOTSZjmWtjXHGuLFGSfNnSWdArAZtttMQsWd1AazpqdSBDSzmDZhVSexhoVJQzb
         a1D4anYsGFOujgI4/0ltB7gFVWgsIob5J5ICBdsfHMBhuDr77aP+3yqJPKvORPyWFtyV
         g53g==
X-Forwarded-Encrypted: i=1; AJvYcCU+jO3XKhHoDCWGYJyIdGW3dP9M3ur7YJN8LRQu/1xiV8UtqN1QLdX8Sgk95u9Vynxw5vZ67nci9WLm2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyriVtcUi0kKmlsheJ2JMUoSeEKaDI1WIHH14aIiRbbn4gWM6i1
	8cg1ca4mPQXs8y3L8n+c9KB1W1+EVGxCtWDeJtMylTLB9K/z3dIZ
X-Google-Smtp-Source: AGHT+IFfvqMK9GbFqDOZdFvb8j2DCucKOk0qdQPlVNUo+VQIMAi19mPFqP3vzp3bFje3LVb4xZypOg==
X-Received: by 2002:a05:6512:2389:b0:539:ebb6:7b36 with SMTP id 2adb3069b0e04-53d862c587dmr6133828e87.25.1731344162409;
        Mon, 11 Nov 2024 08:56:02 -0800 (PST)
Received: from localhost.localdomain (c90-142-33-119.bredband.tele2.se. [90.142.33.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a7387sm1624737e87.140.2024.11.11.08.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 08:56:01 -0800 (PST)
From: codekipper@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	lander@jagmn.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	wens@csie.org,
	u.kleine-koenig@baylibre.com,
	Marcus Cooper <codekipper@gmail.com>
Subject: [PATCH 0/3] ASoC: sun4i-spdif: Add 24bit support
Date: Mon, 11 Nov 2024 17:55:28 +0100
Message-ID: <20241111165600.57219-1-codekipper@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marcus Cooper <codekipper@gmail.com>

Hi All,
I've tested this patch series on the Allwinner H3, A64, H6 and H313 SoCs
up to 192KHz.
24bit support is working on my H313 board but 16bit plays a bit slow and
I suspect that there is an issue with the clock setups. This is even
present without this patch stack. I would look to address this asap,
but for now can you please review what's here. 
BR,
CK

George Lander (1):
  ASoC: sun4i-spdif: Add clock multiplier settings

Marcus Cooper (2):
  ASoC: sun4i-spdif: Always set the valid data to be the MSB
  ASoC: sun4i-spdif: Add working 24bit audio support

 sound/soc/sunxi/sun4i-spdif.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

-- 
2.47.0

