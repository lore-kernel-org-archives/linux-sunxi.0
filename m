Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762532;
	b=c/ScPpDNVoazXmq0YVApKyNeimFl31uL0+ZvFBcLYv69fjuKemMVsBG2yExhOAzGm6TO
	 Nvk9p3evto5cFKqM88DPpfFu+RSLMSVpQUoU9JWiOzBBH35Ej8issJ6/PrmKA7cjm2EQW
	 HAtYSndExjhARuWeTmVz6wjvwtkWlzanS0XrE/wF5srAQ+MkWVCVIUPczzXmsy1uA/7W3
	 vl87Mpcaw9a1frShmXcbombDExN08aFg6mBDYcXPneIPYqnfkqWppzRP6K6GMhPgZYl6d
	 A0YXPgkDYWFr5HaEZwpn0eHKrSPutz+09zdLHNETJW4leEGiFamIMufjEhcQl9Jd4mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AaDlPP9AgpeRRzKJsnNMnsNsKii7YPU68T/y3zRCJcQ=;
	b=q0+suyY13lvHUzCtKcL7stj4O3Qcs2y8Fkif4XMzZKG1V465VHUzUETKOkqWtbCqAzt+
	 vm6nbcn5rpWpfDNikuGcZe4q74fu5/efVIp+LsT6/XPPb4Z5gpk7cFmg2dyZ3xptvlSWe
	 DMPlaki8XKnVq2rvLTghoCXTEnXE2/K0BpMXqZYtKEk4k2F4bEgLOGNntGu8LYoYS2CnK
	 x76ZDy3cbJyM6evJWeadA3Ayy1Fxcfj8xESiSTtolZr6eVuP42DHZ/T3zNuBXJOyME6lV
	 Fceu9QAKlgPg/UBC+jLkJzsha8AnfHzAxkd4P+HIaGJVdGA6CTYDf9x7Qt+IBD0ornw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QfSUXlVt;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A86606A334
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 06:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A86606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QfSUXlVt
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb61185057so49595605e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 22:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762531; x=1796367331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaDlPP9AgpeRRzKJsnNMnsNsKii7YPU68T/y3zRCJcQ=;
        b=QfSUXlVtibj9URBrAG4ddeklDZnRA3U8rHJiI7AfxdqEwPX6sXuvuH4RzTZjB5EG1u
         8VCTki59gpsxvEk3Y4TUkiFy2ITHUuRPhTvjcFtSPpXqe8kzOJDyXnRUyPkBzm/n9dB3
         C5r9cdkqV6X79+h4qY2H5bfndk1Hrg8awVdJMfRmi/13iEAyVzz7yKR7iGbtQwdBbh9m
         M1aTAuCnzlKwCzrEji9BPP62SuBtETkYkvRMaYarn1Qk2yTaW0gCk8ByQd689PX3sWMC
         C3X201efclYz2rtpmWvZo218fqcwgWhyJzXRLKsN8PlVB28Z4L517/L9EDWNyc2y3KiQ
         zOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762531; x=1796367331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AaDlPP9AgpeRRzKJsnNMnsNsKii7YPU68T/y3zRCJcQ=;
        b=NceQzfl4EBS1MNf3wNTpXEsdGVdWIYigNxSLgljrkt+T8R0EbL+Yr1+N81863pZvAy
         Zst3cwfhaROyxsVEo0rdMoTHeaZxoNNVCdx6Hl6Vwi61cr5iIPFL2ZIkkv8LEuwEbxpn
         Gs2djBXx9Vb7X22j5MX4H+KBz5VE92VASwlmYhHvWuHnHW3XXulte0kH+ssaSsFXSJx2
         sWnWHYLQFzvYoLMnHy87dcFBsxITFjisbAd7JskGjrAjmukk/nyBOKZ0EvSsi8cQTgak
         4B2uTFQEeQKTnBCw7VFE6Dp+TyMkKBOAs6zrL1WfSoa5Jz8cbbB/KYV33pbFO9G7lcEZ
         ff/A==
X-Forwarded-Encrypted: i=1; AL+hErGAiZe2lyOb7+mZVL4HNRTZL0zRgxErrJasCIctEC0Mi6GOcLw8rkcD5C0cqw38iYsjY5Go47sph5mxqA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9K9K+/FYyn/DFGHfaFABYdQG+bAnlIZoi8ROpQqszNtqOXBfkw
	zPqEAF6+F3YCmDpWMp3nGRHSb/E6rZLLUYiv4hkfq3Cy1rjWe3Imxrgk
X-Gm-Gg: AZFdTZd3ijSLo5/G+32BDOKBpFTTHh+ziv3b6wZK9XVpNMj7Rigyyrjx6KsBeewPn2z
	9fK7ajwR2INhQFoY7rgw8OQG3rzxG6kaHyRyQs2nx6Nq1bfyeiixVYFlp8iMJSA7lI/0RvnkhJJ
	cjWLVQVslbSqkqW9hYhoLuOclq1IwjSzMjm5xydM/UfKJ45wsMNUyv+b2XLLH0Iw7s9om6/KH+4
	LlQHAnBCGEvyf/64yxjcUTBpearEs35ZKyGToZEzPDTX2SWUSMaUO+R3wPrKzJuOvIn4B1R0FdG
	ZmJdJKPWTUhea3bsXzlGmNwvBJeCGsi4n+rTWGxrGRzDDGV9w2SD7Y69t/C8xiMllIHp+3OZWx6
	1wSKxyOfS2lomQw4wsXEehKvsldVFK2udQYuKIlh+jo4qI54H5SLrOaSP779kXT4PpZN7Dv+0nx
	iAGj3xbcJK31dKdlnC46TwEgKccoXEWsr2+dxE1ldebHpKXz2MAnvYHYYJHk24jQzJfCkxUlfIS
	R+nHH2sC1ttDcg4va1PF2zjkFcb7TYGEggtQ0rZOFgNSrP4f6teYI/ZlltsOFm0oAsF1LmFPsAX
	7or4WNvXMiQDSvOiPQMOg3IXGs8WNpMW93ypGl5pnBiZcqdLu7HYoAMwpzPhtjO/uwDp7bu6lrd
	17DHT1VYhm/42gTAV7CouAU7APqi5AOtGhMrtSJUy24G4phk8eJJkbROk/kPky/8dRNQcsuSTqW
	NpEx42LAexIrdccmZYOlUiLebxQVsLqSNhl1YmLcJmUxyxuuHpsP3ZlyRJRhMk4wua+ZhLPokF7
	s96jH9SU0wQaMDAvbfb7E0DTCjaY+YMDCOr6aQqWwrMjUnutzHCud+Nt34916c=
X-Received: by 2002:a05:600c:3b99:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb8880b984mr542353575e9.14.1795762530660;
        Thu, 26 Nov 2026 22:55:30 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm42574611f8f.34.2026.11.26.22.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:55:30 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/3] staging: media: cedrus: take the output line stride from the capture format
Date: Fri, 27 Nov 2026 07:55:21 +0100
Message-ID: <20261127065523.3685726-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
References: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cedrus_dst_format_set() programs the line stride of the untiled output
formats as the width aligned to 16, which is the bytesperline that
cedrus_prepare_format() gives these formats. Program bytesperline
itself instead, so that a decoder can use a larger stride, and so that
the stride is the one of the buffer when a decoder sets the format up
for a frame smaller than it.

Likewise, take the height as it is: cedrus_prepare_format() already
aligns it to 16 for these formats.

No functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index b66d855daaf8..7e742cbb1cdd 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -84,7 +84,7 @@ void cedrus_engine_disable(struct cedrus_dev *dev)
 void cedrus_dst_format_set(struct cedrus_dev *dev,
 			   struct v4l2_pix_format *fmt)
 {
-	unsigned int width = fmt->width;
+	unsigned int bytesperline = fmt->bytesperline;
 	unsigned int height = fmt->height;
 	u32 chroma_size;
 	u32 reg;
@@ -94,7 +94,7 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 	case V4L2_PIX_FMT_NV21:
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
-		chroma_size = ALIGN(width, 16) * ALIGN(height, 16) / 2;
+		chroma_size = bytesperline * height / 2;
 
 		switch (fmt->pixelformat) {
 		case V4L2_PIX_FMT_NV12:
@@ -116,8 +116,8 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 		reg = chroma_size / 2;
 		cedrus_write(dev, VE_PRIMARY_CHROMA_BUF_LEN, reg);
 
-		reg = VE_PRIMARY_FB_LINE_STRIDE_LUMA(ALIGN(width, 16)) |
-		      VE_PRIMARY_FB_LINE_STRIDE_CHROMA(ALIGN(width, 16) / 2);
+		reg = VE_PRIMARY_FB_LINE_STRIDE_LUMA(bytesperline) |
+		      VE_PRIMARY_FB_LINE_STRIDE_CHROMA(bytesperline / 2);
 		cedrus_write(dev, VE_PRIMARY_FB_LINE_STRIDE, reg);
 
 		break;
-- 
2.43.0

