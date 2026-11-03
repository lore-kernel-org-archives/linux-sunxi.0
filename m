Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739275;
	b=4sGtIP+MGvPaQOoiUKXZXKu+dgU0R78OhEzhJ/5faC85Chzj3UmyAZxUT6QgxGQtnR1N
	 wS4SKO8rBx32WUs8+Xf7lIjdAO/BsTT0jdaDwP8D2r8cEyjaIQ45sth8LAT95UpNXIIpY
	 sOoqHeB76+jdTb3eUGlvbrqvzxD/oqq/DlKI79r+yACmtcoYhAp+zF/PYRAx5BL1vqehw
	 +ak0CIk1jGMZcYzVpb2yhxE2vvkJpLZoLlXBqbc7/XLOyho0c0Z58R/MV3VTZksBv9s49
	 spdM9TkleSpeBQPveyxkKiF2+wvdqBOUXc1duk7ouDpbGJo2pT53YPVLKvaWhelJS3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=/A80EODLCyXaaGfYKqpHl1AEtmb4ixEKWz6DBGz/WQs=;
	b=vKTZSgu+NQ1SJ+OEZJLeYZRRj7GxWxnYODIWC1qwQk7oGUzEdtr3TRf4DW/PhcndPyTH
	 WNS8ZdebtU91SrLKPn8DZmhMaMXHlxWD82EVFVmZ1J9hncn6A9MaeWURpT7eKjiZJIPh/
	 9n5FJ1zP5Kquf0PoA6E4i3Ll26h/mw3mOagtC0BmOeHhZQ4/oBqvWaT1OssE8hGVfAYOa
	 dnmCh5UPdfm6H2+YetRW7jSmpxkTz5YuNiXqX1KXLg0Xnl1SUk9ylOCPftFeNKvugcUP4
	 WHUBStLzBZiePI0vPW/JtfCAEfp3lVESe0RAmWW5mJL777AOCslWEK6MD0jHdA6tfug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6V6bAcp;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48744606A32C
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 20:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48744606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6V6bAcp
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b0d126f631so203227b3.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739274; x=1794344074; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/A80EODLCyXaaGfYKqpHl1AEtmb4ixEKWz6DBGz/WQs=;
        b=q6V6bAcpMImDob77dM/3iuZ1bH8cYL6Wxab5ifAiuHfPmQyzLE3wlj5cKZqtCXUi3G
         kTMV4Ew346fCDJPTFwM3EzyIx/cxxWSOm3CKkX0szLfayGoWySDlN4HpAqPP5DNTWrNA
         KP8MnPDmpHEOWL4ayxO9SCc6tdQFgy42cv7n23Wqx0ps/dXYL8vJQfVfuMUJw14Y+OMN
         X+lreF0OStZvPOSu8D9SCedc+08GyIwsE74AkJ7zpO0kTi0/UJCDxVPBS7Q/Q/M0fc6L
         4x/3vbxmVeFKrNKmD8kCsoNo73pGVxOZnYKheuTJfAXPTPWYTRnKBUsYy8RM9MPpLqjj
         HKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739274; x=1794344074;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/A80EODLCyXaaGfYKqpHl1AEtmb4ixEKWz6DBGz/WQs=;
        b=l8kLvp8vlw484EEuL4JtdMaQqU9TkqJAbOv2jv0nf59N8t3Gfy1kX9dLGcdkDtNll5
         7+L+6HIJXdX1prJ6u8zBxrhT1cuWtXvYvltuynFwPPw4kxvUerqT5pMvxwk9T5JO3qZ/
         g0E1/Jho4MXeAkbRsr2786x9wk6q06Ti65V2U/tl5sLiERCMXqNWbMg6vLJe7OeGelZs
         zbNIltU0J7NysSN0pRCmoY1eyQEiYc4qzjpE5Bwdd2vHQm3lPEGzSBLsaE8Flh/zVigv
         otC2+oSZky/JFnxh/V+nzA0UcuglfE6mAC8KI74S54fPXDvGtmpGrjAfTTsdF9VVrgUu
         r5tg==
X-Forwarded-Encrypted: i=1; AKwUvBwp4eDc5oFFXad2Ro6pD810VKDIr2iCk5PDUliXrF5g446O8o0xD2MNx4JA0VpvKRtpj09xSmcbO0VwbA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9bH9rb1qFDJ4Pl1TSMKAxnLNpjfL29gkq4DZF7vF5um3pjHmPy
	9QrIWoc295lDTSSGjvtESjoD2BwuBWQlUQuFUglB6bDHY2oZ48Y7UeCT
X-Gm-Gg: AYBFou2SxfMH+AAoiMZtvLPygSRKDOVLSZSvq3J1PE3kJB2sAKiIzipmNdKxxrXQNVG
	TyyW290vUHSHynIicGXbOa1zcFb/1mXR0C2s4EQVJ9rccD2Qnwk3uxRHbJODJcZ+q/AzkE2ij4b
	GfOD2VFfPB4IHp73XOpxiCxWRHtpC5ts7+7x5I3jbWdRssim9LuTQvXnqKenRdSOvU5F4UGhq/Q
	QEnJ1PVQRjYClm3T34RnEpG2zGSMcO9Mt/1w/8OZpc7oGphXVcOcTR6rPN/3WoY/U3BKxCu/KqR
	Y+3OxH33x9//PJZ7gxO4zW4BNwOasDtwONPrLtxZgVXJBUsxWZW8gfdAL5CGvD4jxjJnLT20G1/
	eDa3GGY9G0fQdbxUGQ4iii0pI0yPW2juv9FhH7eCKyTAHr9y5V+PwlqA7TXjV1AmyxNKaoeRBF/
	X5xvgoH8i4nq/6YzAoAAqqFeLJUquNDyu6NMzXlAIEJDr6v3T4b81UotHjRPtO/X3XpwDo8CEKk
	gVbkI4wTbxe5cyrSlR8JWO2Bb9ryDOgpO4Aen6cZRcwWqNTGLqS3UOO/hlK/q3bmtSlY+ZUjOkm
	D02b5ylaCUY8qgV0WMPe5owfp/gVFqlQVL/5Djb6w+PA8vKEbFpfAxNq9A==
X-Received: by 2002:a05:690c:4992:b0:8b0:e680:616a with SMTP id 00721157ae682-8b2b66f45dcmr112559257b3.24.1793739274317;
        Tue, 03 Nov 2026 12:54:34 -0800 (PST)
Received: from daniel-HP-Stream-Laptop-14 ([172.56.75.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm4805187b3.40.2026.11.03.12.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:54:33 -0800 (PST)
Date: Tue, 3 Nov 2026 15:54:29 -0500
From: Daniel West <daniel.west.dev@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: staging: media: sunxi: cedrus: spelling correction
Message-ID: <aupKBdon3N4Kpnkt@daniel-HP-Stream-Laptop-14>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Correct spelling in comment.

Signed-off-by: Daniel West <daniel.west.dev@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 780da4a8b5af..f57642c0d8fa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	}
 	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
 
-	/* Neightbor information address. */
+	/* Neighbor information address. */
 	reg = VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_info_buf_addr);
 	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
 
-- 
2.51.0

