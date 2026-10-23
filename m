Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780972;
	b=T1/qux8KW7P6aUlmLXBOvcQZTmys7YFT6L0shjZje4MRWMcm2IR4nOnvBOfZwA3NsDpA
	 VEyUax+D9m41N6yoWY+UYIbz9HIGaM5PaiONmimQntbcxrevscBmQr2TA/z5LgnpGBL8e
	 n7jj8LVZplmyDwvW7Fe5ZxtToINHVVR1cKz2SijIeJDX7AY/sfc1rdecrmA/I6sueu+er
	 sJ6GX/T/pzX0aE3IfvXEU0rFtOB9JzfXa9bJto3mjVyScWuSaSGLpUgF3Av4NFPR1nrP9
	 +I8gJPaZHVkd4M+lBsjmXbcB4lQw+AnG3D7zHoWUFVlXegSBHTNwb/t3d7dnGsaAeUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
	b=JHbBfJv2dw+ZjfE94wikfSLMYzTyb70ckUe+BJThPYfCtxP2aq5XSNAcqTCHbd/5qBph
	 7YITHAv/l6LiN+CUE0NoF5Jn0YDIx0NTT+YxZihzmA7BJEJmXXK2SA148a71cmMolMS4Y
	 e2Oanc3PIv2JdLront9MG4oA+PqReN+KPy/D4tmvp9eVV+hXEgGFuDy1Zm0uZJGAUa3Dp
	 3yx+GSmW8DhfkkS+H/lcskObMTeeu7sYd4p16nBfJfyodLCtLKhllvayRvHKs1tC48rxp
	 LJoIOldCjgpyWrOZPELaAuUcdeQjSmt6sOUSfh3L19fWp2p3G0HAMvJGsDGLvmtN5/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cEnpIv0q;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B19606A335
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 18:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50B19606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cEnpIv0q
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4f488ba6e90so302004b6e.3
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 11:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780965; x=1793385765; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=cEnpIv0qwqz0t0fBhWvl0DYyJqnpHLAAvDyC3Es3sI/X4ERPieDgNgFxzMvH8HpJty
         opWXRTAhZeb1ThL41T1gqK1GSGWO0E0PDg6gxpV4Kze3xSERjmbtBNdOEac9a0qBNEr5
         ejHnFP29sQ+ISlnoFrNO8eVs7jHQ8YIerYyWn2/9XwB05HmcgcOrI676Zixh8ESeCbah
         Y9Y60rUXUYEhlsVnteTXyrHp0SmVSxM+wfzx++3uxc93P/YMz9i059y4+hbSXjOm2TXz
         BmuR9vKzWR3rz9bWmDjNL/Be1jZYq9asucrBh69mgakoT1CJVcLmpznJPCjeV1b2UfNQ
         TYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780965; x=1793385765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=vyjZSdnxjX0IcuGb5HasmQq1ByjE09FwH72jxm7O01q/zQ/tqfFy1C3rEQmVgj1m9P
         itztg3MWU5zyqGDFKz0awj1AJuF/cZtwlYebyyXgDHpuLTlwNjEFA3cSRTwB9eT6vCoz
         csn3Q51lDaZiCJGcDbReYtX5QQt0iCXy5h8RnGXaTjBMJy7QFTu+SsYQ7DkG/UNcKIde
         bvw+FVvZrN+9rHLYxlKILgtdJJjwigmTDTLM7LxERFYQLgA+fur7F1RR6e7DyIA7NAsM
         39iZO45SRz4j34kt75+ZQp3KtxigXNna1j+cZ0gnMLtMCUnOZTHRIJEiGwLEcGzb9oFN
         kpbA==
X-Forwarded-Encrypted: i=1; AKwUvBy8T4gqOpXJyCYr+oCb4WgKPH/2AAbdUBJ7TOWSE2e+jpOCdtiZRUNHeIaYNFAg9Ql/eIhlwLpa2Kdp9A==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ/Ocm6I9CbsAuf6i4lcbIeXTB51W/mB6k2aN441fZCTHm09bVR
	Vl1FM4OjnvyhJhLvx5zbbK5LHxGSsSw31NN2pnhzilPUlx6JZGeUQnRL
X-Gm-Gg: AYBFou3fQpf/gX/Y3KsIoss1DhstdQj0gADTpH375VDKpr00/lsMKQ+eW0oE/1/glnK
	C+ui/mNalxySi2FKd6diCG99v2m9dLul5zQKxRSElc8M/YggG0eNp0sYS2UKVIBJ6FUPrs/+qzv
	EaKd7Ey2tEyIgKwPFbA2VfPw0YUsSzWOruoyJpWeqG91EkzSXvhTWgIVhcME9/a35Jo6jY27CeK
	5Xx3T4us7fa8pCWDbwp0eDYMAOthQVx/hjBoPNxfVB1Zo9/EANNq/oM/G/cgMVXc+9UP3m3Xcf3
	djMF+N2ArHi2t5p8K1zZr7dFL3z4e/lLQ+13ukDibJiI+vOCd82sEYsbUArAN5F1zp8YOL3BBsI
	F3qAND6eRTqIZhi4l7PdlCXjykIdltR1oY4mTOkiW7Ab2Ddl2PNqylR1e+EbNOF/GzIh/sATH5k
	fvsAMz+T78ymYM+mLTFBW3McLQhLwLzKU+4c6TZij0sj25A0yQHmbiLk4UO4WIRMRbxjJEUeZRN
	7k+RXAqG1NCeKCDF80e7f7itnNGGLxHTllKcipjE/GJGDghmt1SoGSgsz78TlwNyYLu4iJ/ZGZ4
	ONUotdE//4yLgGpSp/Nwa9enObtOjvT8tEHficQ0EO+mROMzllYhBfvEfkgn4BJUvq6+MlyfsM4
	C+g5XuxjP+naN+6Sv9cqV9PKWvHql81NIsfEXixjg/PQIPXgaQUo99EFw2HRJ90U8R2ZCvuN7tO
	4BiQ==
X-Received: by 2002:a05:6808:1819:b0:539:596f:6623 with SMTP id 5614622812f47-55c0035e613mr53516b6e.64.1792780965312;
        Fri, 23 Oct 2026 11:42:45 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:36 -0600
Subject: [PATCH v2 2/6] dmaengine: sun6i: handle the last partial interrupt
 bank
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-2-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The number of physical channels need not be a multiple of the number
covered by an interrupt-status register. H3 has twelve channels and
eight channels per bank. Rounding down the number of banks leaves its
channels 8 through 11 without completion handling.

Round up the number of banks to visit, and stop processing the last bank
at num_pchans so unused status bits cannot index past the physical-channel
array. Use the controller's configured bank size for both limits and
the physical-channel index.

Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9d94a37fcf10..0a9645171180 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -587,12 +587,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 {
 	struct sun6i_dma_dev *sdev = dev_id;
+	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -602,8 +603,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
+		for (j = 0; j < channels_per_reg &&
+		     i * channels_per_reg + j < sdev->num_pchans && status; j++) {
+			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

