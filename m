Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4864827F18F
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772119631; cv=none; b=Zy+v6Q+KnrE+HQOqz4bDfg3BdQ9EAJt8iQ5Anv36/2KUWKPMJBaoeRAXzJmpkpN437cqW5mRFDgTkf4ZMFtQKipZ27Bt2b4lrtruW2V/34hosYYkAZthphkfgoZgrkmLjv5YeG7z/dur8BwFCI3mwQWEOJFX/GFvMT0J9NRObKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772119631; c=relaxed/simple;
	bh=TqPrfZLT95yVJpouFPAY4mg27r8HgvUrMOyGUoLI24s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bRL7rGu9jIG1rgTPNAz+GOT/x63xGWN7qI3ZmVCPdrOcWEwx3EfZX2/C7pt7nkD7OWF/BqKUr/To2dSQZsUhB/thjTlS1NLd9qOHUUvgNauAx+f5AqNTyqNsoqJiLsuCZwD0fRzGNsxjqJ0smYiVcFz9RWyk4JkkCwMgCp+0dS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdRTCd+Z; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdRTCd+Z"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1271257ae53so1145751c88.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 07:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772119629; x=1772724429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysB8qazw9WdL090G1GcBnHN4qzpigP9WSIuSWTG5Q2o=;
        b=IdRTCd+ZW/uV6i/cTh+ASE0czPx68oUEsDnzwLSNgAX6+lMpmEOgkwBnmOmKjfy+mV
         uDMcK/Z1490w9+ZwXGe0SBzRSKWGIppOb6CaKEvuLHTI4coDr/Ere1fLx4wYmuA/mwDf
         JcL6T9aC5YKcOkVshYA7w0etsVCSj7GKn+zLJaxuyRPBYHAqkeIcTIDmusj1Fm9P83jG
         zS8dPhh/EpYJRxzCYAqaj//5+V8VsmKtsXa87EZbC35P7jYtyIKPPTp2Nw0/WsOJrfYR
         xzisq1S0NKIwaFtyMGNlbCyj5CXbwfyLXucYIjlV47z2fvLooS2YXVQyfS3xbSTYuelt
         82Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772119629; x=1772724429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ysB8qazw9WdL090G1GcBnHN4qzpigP9WSIuSWTG5Q2o=;
        b=TXvNvJqHQLxjkpwgMiZqe0VI4UZcZn82LiLixUH61nDL6grrT+M4aa6WitbVIR6hzX
         plk5gJI6KB3RNJ+EKN7QBF3l5Yg26iggKhwVm4Re+Qs+6VGSmvhHm2qUbNbsb+5YUiwh
         THllr0MfjA40M3ycesQqWqEKJY9IgxxdiJoswL9x8K31/KzuQC4SeGMH8dK5Aa32tYbj
         t2LEuiLgp90BYUnk26Ej+UXCEz7QSDSaCKq4L3nA2bPXL7GwirQAUXb1sutc1ObUawlY
         0sf8YqMOOZ1RfIKUiUA8tqa4olBAfn2FSaKJAqYu1SL/g2XNkl+St7vVHay9hviu26P5
         HtcA==
X-Forwarded-Encrypted: i=1; AJvYcCUR2M6tnWZDnMB1+3ImxXS7LCNBE/ZBzXDPJa8LlDZgR9o8TVvTp0kq+cMUkMbf6Pxcszgsr1D9ayXSbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFff89TAY7Rcetielmfzf2AY//lCjFiik7eB78IPfl0bjGTOVV
	YaT5Qz5F07kV91PXsDWpASVYArKCZ4ybQ1LZ3OQ5kBrOmn089cGkW0pT
X-Gm-Gg: ATEYQzzuu5y4oiECf8gyRx/hEDRGJeB2BOLL9L9hzEGlyvURcwDhRsaaSBfwsMSMYgP
	xQzQDWe8etiyXbpgkYPRghn1sWTBS7oDQz8+69Bgb9q86XcWdSKYhSxlg+tvBrgHQb3Z9Q+7R6P
	Y+71v49k7jj8se4v5cppT0m6MB3HCYcwUXt/ZeibNfBVHcP2k6A/j1e9qX639AiPvq4/U7hSNNS
	kNpfIhzGtAUhoO04bK/IOdaxDhj4UMWUS6c9yWBFzdBvQYjewZ1sio7erFDWH0lK30tnHCdaiXc
	zen36TWBlOWcUVyxJwQun4XHpoEqnJ1R/vO84SRg0ecNVy/vtxBEsFdVgYmsmQRM/fOhuWnWmR+
	Z4WxaKIAgkm3TTa8yzLtYsmhkdFjuPfCkBcYg2SlqUse1041iyljBY99T/k4a9brpAotKkX3WnT
	lEQGr6pK8hTphWcWON+OVREdMIJVQ2vtSWv10FgPfbjpUDjbS/X5b0D5kqv8Hvvg==
X-Received: by 2002:a05:7022:4384:b0:11c:ec20:ea1f with SMTP id a92af1059eb24-12789ccb8d4mr1228765c88.33.1772119629259;
        Thu, 26 Feb 2026 07:27:09 -0800 (PST)
Received: from arch.localdomain ([149.34.251.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899dfc47sm2694569c88.6.2026.02.26.07.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:27:08 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	mripard@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
Date: Thu, 26 Feb 2026 23:27:02 +0800
Message-ID: <20260226152702.42051-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4d6c13d8-fd06-4cf4-9ac1-0a3e595092b7@kernel.org>
References: <4d6c13d8-fd06-4cf4-9ac1-0a3e595092b7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On 26/02/2026 09:48, Jun Yan wrote:
> > TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
> > equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
> > WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
> > one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
> > infrared input.
> > 
> > It was released by UQsoft as a blockchain-based terminal and is
> > now discontinued and no longer supported.
> > 
> >   https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
> 
> This name and footer at that page suggests name "ultrapower" not "uqsoft".
UQSoft (Beijing UQSOFT Interactive Technology Co., Ltd.) is a wholly-owned subsidiary of 
Ultrapower (Beijing Ultrapower Software Co., Ltd.).

TaiqiCat A01 was released by UQSoft, with its product homepage[1] hosted on Ultrapower's 
official website[2].

It should be noted that UQSoft's official website is no longer operational, and the 
company is seemingly discontinued.

Therefore, I think it appropriate to revise the relevant information to Ultrapower, 
if this is acceptable to you.

[1] https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
[2] https://www.ultrapower.com.cn/
> 
> 
> 
> Best regards,
> Krzysztof

