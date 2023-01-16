Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5001779DC
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Jan 2023 23:26:33 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id h12-20020a05600c314c00b003da50afcb33so4680040wmo.4
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Jan 2023 15:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxTSnhrRy0EXIKGONwWnaThYVL0KmOYpIgvSIb18frw=;
        b=mQye/zMRF18PPYCBBFfNtW/A5q1mLqaAcyb+Fq3P5/3eOswfoWbF94JPYE+CUR+cNH
         CQrH2R10z+vbWJb0o47c3NKSlUwLXpHWC3nSEa2JqvnDp/n5wd7ll5SA3UyWX6oiiZXl
         quYgjP7hhIOLkiR+rWjOCH1FkYDJzwuWNzUIps3Oe4KzW4V60kfmnqBQUCQa+cEg7Z56
         ecUI7P4QVevsF41xKAbTniSG4It9dHsFVjgwoEyPJ8d1mWgcd9ePi88yG5kurrqn4jok
         OnzYyIRFrQE06czbuYnzNzZKEf7TBdEWxiVAk7+eIdL+M3/QUtt8dAKWANvBzEI1HU1Q
         04tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxTSnhrRy0EXIKGONwWnaThYVL0KmOYpIgvSIb18frw=;
        b=I2Cr90/uUY4tFw+y8jk7nlNnRo7Q4TjVxf2cBi34jZhKWh37O4fynDjM2WcQ5byJgv
         ZrrnqcmGjfWCDPACgPlHe/SqMpiIxKgTBhHQGwdKcKJHg3G/lwcQSmhlqLJNC7UqIXeM
         pbQwdKcu5+lKfK7QTtWxrtn2DP5SjaaGyN0IZNZI+8qaAD0EJGBQbVfsH4xaYZ/qTmIh
         I1bo4a4Hy8afZq46gVpOFSjxnxr7jP5SQPwjzX4bjKGI+cK7m01zv0uGxQrl1pDYpm7C
         LAzxppOhW8Ew+xdC0m2tMctGTmD+tPZQGR2JNlNWDYYiXsUitB/RurEgr0eEJiwrFYhn
         BA5A==
X-Gm-Message-State: AFqh2kr45OZ10b2tvAtQTlMGW1MdPvLpRET8JFdEvKLEUQwOslty5atr
	Qwc7iD2cT9TppEBMO46FdnRU11iVl2xpfm5N
X-Google-Smtp-Source: AMrXdXueQadTTrugde9kK0zdGlzTnf6Ql6yOas6xOKfLKwhxL2wc3sC1a71ow4kqTj6awHYPvOKDtw==
X-Received: by 2002:a05:600c:5409:b0:3da:f66a:e866 with SMTP id he9-20020a05600c540900b003daf66ae866mr1088369wmb.10.1673911591337;
        Mon, 16 Jan 2023 15:26:31 -0800 (PST)
Received: from localhost.localdomain (mm-88-61-120-178.brest.dynamic.pppoe.byfly.by. [178.120.61.88])
        by smtp.gmail.com with ESMTPSA id he12-20020a05600c540c00b003d9ddc82450sm34276915wmb.45.2023.01.16.15.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 15:26:30 -0800 (PST)
From: Oleg Verych <olecom@gmail.com>
To: linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Cc: Oleg Verych <olecom@gmail.com>,
	=?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: [PATCH] doc sunxi: update CCU wiki page link in clocks.rst
Date: Tue, 17 Jan 2023 02:22:09 +0300
Message-Id: <20230116232209.4744-1-olecom@gmail.com>
X-Mailer: git-send-email 2.35.1.windows.2
In-Reply-To: <20230107083749.2419-1-olecom@gmail.com>
References: <20230107083749.2419-1-olecom@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update wiki page link to the Allwinner sunXi SoC Clock Control Module.

Signed-off-by: Oleg Verych <olecom@gmail.com> 
---
Hi!

Can I ask additional question to those in the file?

How is it possible to setup PLL7 to particular frequency and select
it as a source to CSI0 via CCM_CSI0_CLK[1]?

Is it possible to put such device tree example in documentation?

Thanks!

[1] https://linux-sunxi.org/Clock_Control_Module#CCM_CSI0_CLK

 Documentation/arm/sunxi/clocks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arm/sunxi/clocks.rst b/Documentation/arm/sunxi/clocks.rst
index 23bd03f3e..f435bdd70 100644
--- a/Documentation/arm/sunxi/clocks.rst
+++ b/Documentation/arm/sunxi/clocks.rst
@@ -49,7 +49,7 @@ Q: Were can I learn more about the sunxi clocks?
 A: The linux-sunxi wiki contains a page documenting the clock registers,
    you can find it at
 
-        http://linux-sunxi.org/A10/CCM
+        https://linux-sunxi.org/Clock_Control_Module
 
    The authoritative source for information at this time is the ccmu driver
    released by Allwinner, you can find it at
-- 
2.20.1

