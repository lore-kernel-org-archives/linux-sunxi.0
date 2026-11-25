Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591293;
	b=ELOjBpxMJvwSzt/lTzwFU69KeBpRg2TbVaOcSG0Caz6XO4P5iJLU4EHZOQcDcIe7xY0i
	 PdVPGYsLo3c5JJUco1B9e3YEIUHFurXXoG/ufBVDy6GuisLQUavsfIUGSXi94n9pa1oUS
	 yBwXoJ1RxJR5ZZ7P3e8VUWaI5GP0BIMZaD+7OjYQtOAuiLPDiV6bHGHfOozzrlXF9N4Q0
	 S9TzD08aZ9/ndbwZI+Tbkf0IKgLQ1RL0nBUG3fQqDjwZJVILYDAAZ96flxLqJjGJylz48
	 ezXU4J5MlpsuB6QQHuw7f42nokShDG/fzumNwYAYvtWC+MQGTHqp5Kqb4joCkYbrnFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R52vvQCOEP2yQoOtzfmf3tXHj9q6TsgHnskwuN5yzD0=;
	b=CqDbvowNbcHHyoBC4GqkGpm4bcPgrv2nsel1+AesSxU3Z05+iS0OyE4KZgekpX/Mq+RW
	 kdAblt92g7jKM1k5l6hS+xEH8KL8f2CTvt+4WsIUQA1kxTbff1VRcOactLFlRhnF/LjQ7
	 suY19+3fTNutU8oFo470OSMHHQIkyf/HM3L/iupj8xgoYi42L6Fpegegeapg3aHFVeLwP
	 NukpWJVn1HvHIpsRTqVoJYGJ+L+64pVVot9PEXM+iDkd10ccILyVZoUdXXfjkA3WaV9GK
	 Itq9eSj1OcC6DbW4YvjL6VxJI8k1j5rR0b4d1Bxy+hmW5HiP2rgEb6yNLnSsQFlfnpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H96Xb7b3;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE71606A323
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 07:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE71606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H96Xb7b3
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386d1859e1cso237477eec.0
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 23:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591292; x=1796196092; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R52vvQCOEP2yQoOtzfmf3tXHj9q6TsgHnskwuN5yzD0=;
        b=H96Xb7b3xuGfBkSCu0vSOzrVGNjrqVQtvrM7C1hNMkgk1nAhXE8HbuUWpcbPxDtsqY
         y9Vz/YbLSel07wTGOOMqtiZaf0RmJ79xfX1nHlE4++rs4wvUfFovdSC7UvIorusl3ZJW
         Ms+bkEhZnYzUigaELz1tB/FYdBJgzyWrrSgAj+RJ+DYj0f8VuS/iF6ywwfVgCNLu9TWJ
         MMsG/7ALi4M6T3vRDOMCSBbNF745ttRbW+mZxlvTNeliki8sNBPCMfzyurcr0nA+kO/2
         4Un7WPVFoLgTO5Mk7nvAXHXyBHViiL+gpro5Cf71LIe71vcxnq+WMF87ejI+2nWsQsNy
         mxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591292; x=1796196092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R52vvQCOEP2yQoOtzfmf3tXHj9q6TsgHnskwuN5yzD0=;
        b=GJ0FYRSsR11RCb2VKR5SlnsKbTp5uiLTlGvHslog48J84LtJzw9q7zjgGboS6Rn5IX
         t2FyNvBAkkF5moAAqkYAIpuKCBmKcJCqTxVWYUBTkxAsNM01AcPFdL6F/R+CX5QEbiz4
         EodqOuADo/dM9jdHN8xccCAqSsOBV3ORmqYOJZZv4pMi0G5k11ScQuGlKh8JxQTfnL/M
         +5rCnFZnYYSf40DeFMdG6yqPt3P3yQHafVguxC/cSr7V0UAWweytbpzKQmxnq2A67oC4
         ZiMp2RMemS2kVEJYpu68+w9P2LICrsoo4i1yYi9c8kRl3jJEA1NwiNiQjz3gR9aPMuQ9
         GAhQ==
X-Forwarded-Encrypted: i=1; AL+hErGlw1DAfKiGX++Mer/aKDr8qIM6SpUVGb1a+2MoYptkbtz5JiIemD5bu4/4l+SE/sdRbtBYE37taIdIuA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+zVTwxPqmGhTOiMA83DPkiKUV9nWQUtdmbidaayNTXmi1QsiEs
	Ui3bHL2mpHvA7fh7IKCrQf2p4d9lnc6Y2Vg6luqHnVu0VlxKLo43zDYj2upnDtwK
X-Gm-Gg: AZFdTZcFlp7VgGGRrWg/48Xh5ir4d8+agKvCbpCTvDRil+tBZcqSpDpExZdIW+3VCjd
	bO6SRQ/63nU41eQKdn9/qD6bwEU4jNOyUgDrf6UVLYYhYKj60Cj68t7q9iExYhAlM6CzAPLrPbE
	sZJNHwiyPK0XnZf38tcJTMpGZcBF9ddANTmje1WQ3SiFOeg+YZ9Nx/GY5n+Rs7NyRLRQ6/Umshi
	uQC0jdo4XRP2VQQ3Brnr4AZy7aoc+irIii4YpNokQfKKnUcFDzD9ttOmuJ7b3W27aocHMf5dN8l
	6c7OMlfKQ0lPutMn8lagqBV7v3SzjjJ2urcQ+JV2q1eT/1rAs5cQ6UCP0XO7svLDEf/cFO/7yb0
	/wv3OZSDHmzLKtuZN7Qa/lI1VQWjaosElpnd6eJ/ARE4nURBaxGiM33NKMsYuPdM5623stTQsDM
	tCQmibWM9BhDTM/RYcwPrCUR9oRHKTM/7nadnqoJ5oCwXq0Meu5TuS6f4vYdmW+r9EAwI89/EAX
	ExWHfLYOzNP8TYtSBvpz0za0oHkaJNq757JUSFAN962yCLoFNXKevRvPAsaDBlQObCOFaZnOeFB
	VuTCKBibD1pCIgQ87Z+bF7KJG4cNOE7Wahf4SZUcShTTchNXIDz1tRWKG0xXdw7j
X-Received: by 2002:a05:693c:8943:20b0:386:af00:e9a6 with SMTP id 5a478bee46e88-386af00eb48mr8612674eec.2.1795591291989;
        Tue, 24 Nov 2026 23:21:31 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm62232352eec.11.2026.11.24.23.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:21:31 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH 0/3] Input: clear the wake IRQ on unbind
Date: Wed, 25 Nov 2026 16:21:21 +0900
Message-Id: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
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

From: Prasanth R <ragaprasanth@gmail.com>

These drivers set a wake IRQ with dev_pm_set_wake_irq() and never clear
it. After unbind and bind, dev_pm_set_wake_irq() warns "wake irq already
initialized" and returns -EEXIST.

Switch them to the device-managed helpers.

Patch 1 is tested on an i.MX6Q SABRE-SD board by unbinding and binding
the driver through sysfs. The others are compile-tested only (ARM,
clang, W=1).

I used an AI assistant (Claude) to find these and write the changes.

Prasanth R (3):
  Input: snvs_pwrkey - clear the wake IRQ on unbind
  Input: sun4i-lradc-keys - clear the wake IRQ on unbind
  Input: da9063 - clear the wake IRQ on unbind

 drivers/input/keyboard/snvs_pwrkey.c      | 9 +++++++--
 drivers/input/keyboard/sun4i-lradc-keys.c | 2 +-
 drivers/input/misc/da9063_onkey.c         | 4 ++--
 3 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.43.0

