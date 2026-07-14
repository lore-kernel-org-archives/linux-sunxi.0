Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D164A4A13BE;
	Tue, 14 Jul 2026 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042396; cv=none; b=N5QN/7p7e3pPN8L3baG0kof1taSqkMc/POeeDqdfFFWuLiwiYMZ3qT38YyaYaeoDg2nR/yg+i1ieNAcEDpYvWH6JtJ1Vh6fu2AHKlzeCFX3YSv8TVh8t9EVFpdbiMc7A5KD+aQEs2HJaJvygyKHMlf8oWZWMV5av1FcS4iSNy4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042396; c=relaxed/simple;
	bh=C3ZkphYTD4mKarOI3akfQ1i8GYQSXFfMExjPFhSX9ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mhVTLOyT2K89uadmDBj7QWA2suQ4jVPRsWdaKLKuadeFg/pzzAHxrZOjZVnjTIb1aThAuOiuuUIjYuMV10xAkv+DLPQSXar/T7h+MCEGhgGKuYbHkGZfJ18u4xzyBvSSsEdizXTVu38Cnn08tveNRng4ovV9o4718bV353FUSvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7H5FF3q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7H5FF3q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CCD1F000E9;
	Tue, 14 Jul 2026 15:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784042395;
	bh=xiZQB8gwrJDrCywMudYQRs1hEye2ekt3JZl88zWIo0I=;
	h=From:To:Cc:Subject:Date;
	b=F7H5FF3qKIhZKnBbYLMums6Nb0FKwdyYH+TE16TOxnfLdb59P0AZvh0gRsr2MZlem
	 DrQH2IPtnJypWBoRO/Nm0fgpz2JDLJXDO9gj+hDzjAdqz5oARvZu2j2dEuvDRxyjZJ
	 fQqWKkM7nnnX7bR1S6S2I2QW/aTRF3ePVQUnlFx936slULa3CFlyAcrtNLATT60qOM
	 cQ4cQ/EQnr2q7zPCt5GmMZrEg+8g4KzirhuxN/vdUlLY73seWO6yqo59L0pWGa+CFk
	 klwuEHwuB6fsDgBuuf9WwPS4RJKxgy7G+Hql/6DlTPXShwsIdKansookKnflMAoAWG
	 ZTjiMWNQqqHng==
Received: by wens.tw (Postfix, from userid 1000)
	id B8D905FC39; Tue, 14 Jul 2026 23:19:52 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: sun4i-codec: Sort sound related #include statements
Date: Tue, 14 Jul 2026 23:19:49 +0800
Message-ID: <20260714151950.316035-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the sound related #include statements are not ordered in
alphabetic order.

Sort them. This results in no functional change.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 sound/soc/sunxi/sun4i-codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 93f511fb6190..2c5cf12f1a6c 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -22,13 +22,13 @@
 #include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/initval.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
-#include <sound/initval.h>
-#include <sound/dmaengine_pcm.h>
 
 /* Codec DAC digital controls and FIFO registers */
 #define SUN4I_CODEC_DAC_DPC			(0x00)
-- 
2.47.3

