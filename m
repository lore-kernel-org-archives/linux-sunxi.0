Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FF3156241
	for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 10:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717152571; cv=none; b=S2/kWIG2OzZnIT36K3NJyGf2aQ0C2/BEzo5E8+uxHmm1wL676gwMqPWmaNuxqqK2O/StQM+Wt4v3XObFc+AtkTTNT4fMtveVxKIjH9CbYf0X0C0gcHmvCpUMX2q5OhVnABTDRd05qUH+l/4Rvw+Vq98BKrnl9LHN4y6qbWYNRwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717152571; c=relaxed/simple;
	bh=pblZuT61VCx5vsKlZZtH1uamW5g6Zzz2eXnPbUTy4hg=;
	h=Date:From:To:Cc:Message-ID:Subject:Mime-Version:Content-Type; b=bCbhJFTHEAGioxGZzM0Y8O4ETXVAad/7krbhFx9XnXj3T0taTdxRptu60YbAEwg/3SDZJxHjGCyOYz6UQxHBmymCw31qvBpQ4ctyn/3tOkeTgT7I0cu4AjMYV0fm9MTEb6GVFtAWhbOikHipn1444ekrL5LEUzSnukIRm2bIEPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=He52/ypQ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="He52/ypQ"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52b0d25b54eso2780145e87.3
        for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 03:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717152569; x=1717757369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:message-id:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tRfMYuc2oZrIFwHAbgozaR/RAHSemeaE5sWTQ1UXSXk=;
        b=He52/ypQXTYl16hPHJ79GJnnFUcQVE7JV2JskvNIZC8ixMg6YzunCu3jVv6mfmnSi+
         751CBpOiObatk1f7cNkNmd/9T9IdJWvcLQwQCr2zEPH/3yAYGtuAyabu/bRRS4GBQd+A
         x8srIi43WgVa/df0Dqa/LTLv0M2evs7MX7Nlclh4i0cbG65+tsHZARERx9zrknK+GCdT
         Ier/5lnAacBs/dVzdGztkmrAPboVOe3tuw7hokv7hs9yu+y0k9KVhDTVEVMiDJkJ8oCi
         PRtXW8oJNadL6fHrdZA7cDRrApMXD93JVEUMl5iZPH80U9rJH9IP268d0TsT0i1Pm9Wc
         4dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717152569; x=1717757369;
        h=content-transfer-encoding:mime-version:subject:message-id:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRfMYuc2oZrIFwHAbgozaR/RAHSemeaE5sWTQ1UXSXk=;
        b=aUX2Jk68ufHmJcGxKR/y+qXXBqm05fIlmbTjkrg4OkH9nOItx28eYaH3lOBMzg/Z9J
         2mWINXKA79AlfJu7J/O84l1BYotO34mTvXp5/Uhp0b0BOPXUzsu67mn4M0/Q0vuYojrd
         ibt1mPc6GwcgLN+MvnEbxR6/DxVslFlZylNRK6KysUR9wRysSS6C9Fk06AHic//NDoCR
         yU6LfzW1dCe+utHIdw9crQsppdHC5QN8xMuvk2l+EtNJ7poEMT6x+Qx/mxZJa8d/NsbS
         69QwxYwvoqUTA48uSLQj5JvwbRPJnhb10StsN2B0qmJFxDndo6RNHJBw1cwCgDZ0Y7ku
         gkog==
X-Forwarded-Encrypted: i=1; AJvYcCVK22TgFRcrzMTXa/jcd3nNcrfDDdf6ApOas4l9818eZiD7Y/ndaGDwAccQQXAinDegUtGdhtnvYW3AOWztIvhmDJO8b4eC604cNgo=
X-Gm-Message-State: AOJu0YyP7prvQu4fDfjPVwaPzELKHyO3MnmJ5PHgfvcLTo6JPwOlhHlX
	m8TUdunUfPuYg5NuPa8ErN972d2lM2OKVGzaXiMhmyrchLP3aqRV
X-Google-Smtp-Source: AGHT+IH93ydQNYGhnusbE4nE+VVAoM3R8/l5TcLUYmIfPgPd/wizUfk0JMXCv81VEGeZWU1NyPKOdQ==
X-Received: by 2002:ac2:48aa:0:b0:523:af1f:89d9 with SMTP id 2adb3069b0e04-52b896afe18mr1248601e87.58.1717152567964;
        Fri, 31 May 2024 03:49:27 -0700 (PDT)
Received: from localhost (host-95-246-50-43.retail.telecomitalia.it. [95.246.50.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e2f5494dsm74207766b.0.2024.05.31.03.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 03:49:27 -0700 (PDT)
Date: Fri, 31 May 2024 12:49:25 +0200
From: Matteo Martelli <matteomartelli3@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Message-ID: <6659ab35e4545_ad3bd3707a@njaxe.notmuch>
Subject: ASoC: sunxi: sun4i-i2s: swapped channels from second capture
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Hello everyone,
I am experiencing an issue with the Pine64 A64 i2s controller, which is
compatible with sun8i-h3-i2s. The Pine64 board is paired with an external codec
(ES8311), which can capture from a mono MIC. MIC data can be sent to both
channels or to only one selected channel. During the first capture everything
works fine, but since the second capture the channels are swapped: e.g. if MIC
data should be recorded on the left channel, it is recorded on the right
channel.

It seems it has nothing to do with the LRCLK which looks correct under the
logic state analyzer, also consider that playback does not show this issue.

It looks like the issue is due the RX FIFO: even after flushing the RX FIFO,
the first read sample is the last sample from previous capture. This likely
causes the channel swapping: the first read sample from the RX FIFO is
attributed to the left channel but it's an old sample, then the second read
sample from the RX FIFO which is the actual first sample from left channel gets
attributed to the right channel, and so on.

By adding an additional sample read operation after the RX FIFO flush the
channels get no longer swapped:
---
diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 5f8d979585b6..a720daff3be9 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -961,10 +961,15 @@ static void sun4i_i2s_start_capture(struct sun4i_i2s *i2s)
        /* Flush RX FIFO */
        regmap_update_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
                           SUN4I_I2S_FIFO_CTRL_FLUSH_RX,
                           SUN4I_I2S_FIFO_CTRL_FLUSH_RX);

+       /* XXX: Additional dummy read otherwise first read is the last from
+        * previous capture, despite flush of the RX FIFO */
+       unsigned int sample;
+       regmap_read(i2s->regmap, SUN4I_I2S_FIFO_RX_REG, &sample);
+
        /* Clear RX counter */
        regmap_write(i2s->regmap, SUN4I_I2S_RX_CNT_REG, 0);

        /* Enable RX Block */
        regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
---

I haven't found any reason for this in the User Manual and by debugging the
registers they look as expected, but maybe I am missing something.
Can this issue be reproduced by anyone else?

Running on linux asoc/for-next branch, commit:
47d09270d777 ("Merge remote-tracking branch 'asoc/for-6.9' into asoc-linus")

Best regards,
Matteo Martelli
