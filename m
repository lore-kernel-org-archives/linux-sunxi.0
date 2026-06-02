Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D213D7D7F
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Jun 2026 11:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400699; cv=none; b=Ft/O4i0OxDQexY/zHC6MmoVfLdHWJJ9tELCacF4lJV1dtrJw1pJTxkMyWhgVerrLTpBRLEh+SIZBIC9mZGdqrMsa3nHNccl5zguG30bCw5KWsKg9PupjvrB7iPO43yZ/9saTC77wKSzqKf5DxJ+JTnDsulNLd1evWocJ+Kczt5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400699; c=relaxed/simple;
	bh=D+0XMPW39FnLt0Zm7R232hYbFcRPALekEAH2h8LzSUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uSkzLvKqWt31QEPfXLsJTSetQ2MR1btBxmHqb9fnAaIIjtwWu9wqBoajaHv3wZ25PIVl+qHdyqAsRHWi0FL/G0uod1ewOtGfyfd/OnqDqNVzgPBuipFtqiGhSjf3y8Euahjl0NplL2e1O96udoq3JFFIF7uJ3L1MLtDG3EzIOT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5uzlpKH; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5uzlpKH"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8423f236418so1060131b3a.1
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Jun 2026 04:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400695; x=1781005495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yMMmEmjYZwsBNnBuWQ83+blc3WIchW2nd/w7lmU2Wns=;
        b=i5uzlpKHGReuznfF0Jg/QJG5u2oyCjPeWcGlXvu/PhYC6w49qqcx0B6D84ZKolYfkk
         54kfcHeTxgWbZxvLumKVPufOtBxJddQBXJqr09mLBUwc3+aVHATO0boprNT+hUZjo56O
         XW5SDstzAeQMtCqWwy18K+oVHXEwI/GbSMSdD/AS/Gaz5Cu5S7VV6yidVTgA1QdEPAVd
         j6KfqXT8VR5obf0kCe7oWPLxuqmCJqXwDnsQdYLkQ6EdC2ahzEBMSGRAaWXwQvxw3y50
         op51LOL6xQtWvJC6WjNSW7JX/LAjjhuB56jMZELD1mgBOXMUBUuN4gcmU8Rfb8srnYMy
         O9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400695; x=1781005495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMMmEmjYZwsBNnBuWQ83+blc3WIchW2nd/w7lmU2Wns=;
        b=qP8aoqrkJGPXq2YY6aG9AFvg1qHoEQZ6qeSW4jm8tUtT6FjHXrxFPeWUZVaPn8pn+j
         JaF2hZtavalvpk4QLYopkVxsblp/aipgnuJZlXIHBqh8B5atsJhk6rleb7gYu1nB65QU
         dQiDGFmMBQrnTuHy3kNjAIqnxU8n6dtM8HnjkCWiMp93Qt/YpNvKv+NNjQdGnoQyPTm3
         r8/fuvnxlUWuVmh5N06DXdrfLNrmLVKa3OYQCtuzVVLta9rYNtoBV7z9j4vCzferqR2n
         XB2piogA7JMp/9NTmXy8Otb/OYXNwRxfp/yociCcGzQ+JiqdBMxjMy49J8i8ijZrvmXJ
         +QFQ==
X-Forwarded-Encrypted: i=1; AFNElJ84g2WaG7gRdhwAHqYw50bwmKN4scCPEQfD7O2NaeAV03uqbzi/hrNXKOrVqHa832NwZ1oRjygxIWZ1Tw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7KuIv+BVXriRcy+rdDNVTJ9KAuJTIMTZdeiV3Dw3wrZj4llAp
	OvCT8nNCk7iSL54xKsW3sg2Dh9O/mx5ld6+k9b+Ns8lzTQZYe2qFaVQJ
X-Gm-Gg: Acq92OEz88qd4a8hRtpB4JNksqKRvjR82UKbqypKhb7Zw12eI03pp9pq07as+0hq7Bn
	UPes6Hjxv2kDhlEDuBDsTWNpHCrW/qrCTfDxoplp4vxBLkfAnTQ4aPV23JqGE9fxy1/BYxYjAee
	2dlxl/rn97qQZEHvrnhLdOtnxjneL//ao9MCcQTpUzw4JRIDb6R1UwOOmAnmAIPsVpjUOmDyNvw
	f/Loait4Ekrg3nIXY24fsujniH3vswmKkqI83GjdlS6oF81xlBDV0TF3/BDuRvuUxibXhRDuEaB
	mynt+YB2kMUnkZ9j/TjbX95zIXTCX4IkKPeYGRflh/CgjkfAhP7GSe/PhYv2D/1qe71yncRgoO/
	SsVYnetxxJzaip+gRyl1q+RoXpJsVzFfsjBznn9qQ2+lyq7FrBzNywjjkGE/AkcxoH1deeT8zk9
	qCCurVVzEI7lL50sQJXspeLS9BxljRV6spO+eCUmoOIrQgwHK+C9QPpC793pKzlRUtnNK8
X-Received: by 2002:a05:6a00:3762:b0:842:2f3d:dff2 with SMTP id d2e1a72fcca58-8422f3de52amr9540311b3a.34.1780400694676;
        Tue, 02 Jun 2026 04:44:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842263539a3sm12025224b3a.44.2026.06.02.04.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:44:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 0/3] ASoC: sunxi: sun4i-spdif: Cleanup and runtime PM improvements
Date: Tue,  2 Jun 2026 18:44:34 +0700
Message-ID: <20260602114437.50324-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi,

This series contains a few improvements for the sun4i-spdif driver,
including guard() conversions and ensuring the device is resumed
via runtime PM before kcontrol register accesses.


Link v1:
https://lore.kernel.org/all/20260513105003.81880-1-phucduc.bui@gmail.com/

Link v2:
https://lore.kernel.org/all/20260522095401.72915-1-phucduc.bui@gmail.com/

Change in v2:
 - Switched from using guard() to scoped_guard()
 - Added runtime PM handling for kcontrol register accesses.
Change in v3:
 - Clarify in the commit message that the resume sequence becomes the
   reverse of the suspend sequence.
 - Add Reported-by tag from Sashiko AI review.


Best Regards,
Phuc


bui duc phuc (3):
  ASoC: sunxi: sun4i-spdif: Use guard() for spin locks
  ASoC: sunxi: sun4i-spdif: Resume device before kcontrol register
    access
  ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence

 sound/soc/sunxi/sun4i-spdif.c | 76 +++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 34 deletions(-)

-- 
2.43.0

