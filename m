Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5081395AC5
	for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581048; cv=none; b=KXlORp3WzHmX3GTSn6X5HM9Ly9HXxmbHD3447YLeQzH+vLdhEJ8p9ZpVRIEmwxtf8Ks7E29Nr2hbf7n5xLeCnriAsm3L6ccwoRbWhZszkt1TW3ZliWHC+YGxoGDESi+87TR+TBQvYgHOEoSMRFKXKnwH7c3T+lB8XdrsRWSj/sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581048; c=relaxed/simple;
	bh=GaMF1Yzm0iNBodfrAG5+rKsJ59TZ63qHdoD1FdqOEgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gRLQA5umvTZ+QIguWSA1YmJ5IGkorPpfPNAJ46LYS/MmHMdV0LtwWfKKBYJkE3PwizzHtoUIu7PY1wvynzpTR4A7e2NqBRs1TipaaslFR+SDUpnN7r0EnfSuru7hGhO9Sdb6avyKCDHyukutDyaev0UW5PXRGhPNjbPp5VSx5+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTiLT5Nt; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTiLT5Nt"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so4895606f8f.2
        for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 03:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778581045; x=1779185845; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ziL0V3bTIpY6V5vrEqboJ/QjSCNIwPUv5YVqghF5mJE=;
        b=PTiLT5NtlkGFzxxCTZdU9k75Pu3stu7iM+JIMj1JGJhny/qN/Gm/eHz/4q4xMmkhbn
         J2WLENjBR4ctbZOQpDVPoJvGuwTTOaLpU1IlBzJJbHZST4BR388P2dDO/JhiuGI9QoKD
         Cs/g2r8kOQnhwvWNHOZbEl4Ei0EQhZbhSgjqiDYnoV1NSHt1KP30MIS8jw5J4EAF/Wpi
         2Wz9UyPv11kJcg8TW/5mXvk7IINZl1mrIUEpDx1cLQ9ympXravtFfvtiUOfC2U8rbW3/
         mhPIsiD8Pke7N3Zke42+RWua3fhKM5SGcGTk6z9N0qffhJSTGA/PqpF6yTz2a0EmVL/h
         vdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778581045; x=1779185845;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ziL0V3bTIpY6V5vrEqboJ/QjSCNIwPUv5YVqghF5mJE=;
        b=VZPDUznJPyMRka/q1Q6fPUTjGnqrVnocNOzLV7z6FHH3UqHvl5wu6iU5Q53fMBrKRm
         V4zj4aFFDP3RCKb598vCtpZ3WJyE6JhnSPw3MWq/EZcZFmzw8qtlY19meRG6a0ub7M63
         Z6EzIpnFTB3AiKYZZCeiyniTwly2d22jYWj/l2qat0iY9efktiSrP9irsSHJTcEwrpX/
         7/S8wGvUboVyMAYLS1Bc9Y7PnJ4bkbhSF6IXNnLo8tgbqueuOhhE7MxJcju8v51tG5zz
         pcUhfBmkpwVdIRisdr5usgzg6zYsvViy5K9oxSMjW0k18WlMkSxkYGdE7Lx0UuT9eFf3
         jxLw==
X-Forwarded-Encrypted: i=1; AFNElJ+IC5JhS7jZxMe/dW4NkVDhGZk33KeuwVHERzBI+bc6aLyfv+i3Q6+TkGavJeohI1Fcr0iClZSgPhIfOg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5+VTE5IEeCs8n5z3KlPjAzgAW/k/URiWzeQghg/UGuIxPpcnX
	FwANoM4jlYyJle01oAk7kMztndEuxdsU6PZWYH2JsCThu6kuXwLZh5Q2
X-Gm-Gg: Acq92OE+enDXVtoKc/Q8A+06xQ/E87UJoC9zT4IBRTkslOMPki3Cow5DE6cii1HEQXi
	vW0uzLJ8GcupC0n2n3RDZwNLjzpe2gexcncFH3uftPs2N0hfbv4XE0EGzKJbMrNN/xrG8TUa8R9
	uG2dVEPHjtI5joSGeEdInYFiRt0jcXI5wKt5sFn/pPdK8MqKbvi3WqDWjtCBdnBCdaJx3hXjB/e
	PCxmoXhgqmnTWvRSDErVQbLG3eKukftcAfxuw/MlRorEHDTbLO0C4gMpwkiliV/i7nAnUwT/GfB
	JCSBEBGTZXkvLoBr4AlchSc1NdBfsOJJcbtktGvjS0PRK3mCnxtCdKRbzhbpbe3+5Dw4GWWrHtb
	o3OgDDu/Xf6DlfbqufxLYeGl/lgAQ5kvUv4VK31HGjXlDV5eKLoNYtoT0QLACU5KClbcTJJKUmt
	VDZxITpuwaCecl8J9o4aSdXNldbplbTw==
X-Received: by 2002:a05:6000:2386:b0:43c:ef4f:79dc with SMTP id ffacd0b85a97d-456969c3922mr19278708f8f.8.1778581045063;
        Tue, 12 May 2026 03:17:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491304505sm31762914f8f.22.2026.05.12.03.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:17:24 -0700 (PDT)
Date: Tue, 12 May 2026 13:17:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: [bug report] dmaengine: sun6i: Fix memory leaks
Message-ID: <agL-MYGNzC278bNc@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Maxime Ripard,

Commit 4fbd804e009a ("dmaengine: sun6i: Fix memory leaks") from Jul
30, 2014 (linux-next), leads to the following Smatch static checker
warning:

drivers/dma/sun6i-dma.c:792 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli' (line 793)
drivers/dma/sun6i-dma.c:873 sun6i_dma_prep_dma_cyclic() error: dereferencing freed memory 'v_lli' (line 874)

drivers/dma/sun6i-dma.c
    783         dev_dbg(chan2dev(chan), "First: %pad\n", &txd->p_lli);
    784         for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
    785              p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
    786                 sun6i_dma_dump_lli(vchan, v_lli, p_lli);
    787 
    788         return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
    789 
    790 err_lli_free:
    791         for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
--> 792              p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
                                                        ^^^^^^^^^^^^^^^^^
This dereferences v_lli to get v_lli->v_lli_next.

    793                 dma_pool_free(sdev->pool, v_lli, p_lli);

We can't use v_lli after passing it to dma_pool_free(). The
dma_pool_free() changes the the first 16 bytes of v_lli so kind of works
here if you're not concerned about something else re-using it and
introducing a race.

    794         kfree(txd);
    795         return NULL;
    796 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
