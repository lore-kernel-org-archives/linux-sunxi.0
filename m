Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA5D2DF703
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Nov 2025 16:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762361070; cv=none; b=gt7x/5EuACXf2nwT0xceG8b9BdpPd+lIIgn082TpMNiRjRlExpEHsJJK0D6moXnn/t2VOCf9EGAeISKhKOp+BpD8U8qI1QumpLVQW3K7+9rHRnQ0qEKZsXU/gpMxedUHAPn/Q3IcPJ3PVdTFV6BjUx+vJLYgMl2M3R1Lq5fnAf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762361070; c=relaxed/simple;
	bh=ZY2ovksieRapgk658pHLWkUZACRChu2RMh3Rj1+1OEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i7qJkj4IABX0v66u6fEyAhickClZ1O8zQHORxLbMOcRMS32u8CEX3y4O+3BHJwpn0ZGlBiSVSq+65yaYOhT4XEdaGZ4Wx8J79bvl6C2MWPZZKjEzxENSelWVMy8fAINxuMkPI55TirFPiZV7IV8gNSVp4NIugUA0lBPYf0qu9F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSrgD0w4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSrgD0w4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4775a52e045so5884725e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Nov 2025 08:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762361067; x=1762965867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY2ovksieRapgk658pHLWkUZACRChu2RMh3Rj1+1OEY=;
        b=kSrgD0w4K+lY1jZjiRFS5j+iNFytLCwr5sz07f2uvmGubFOEkXlOMcYaxnL4413cVr
         jjCsgB1Pvt3o8beuZ3x8FXiOsXcU6e+6ewHg17mbLK29XQy5qVRv5IlKWWBLokz9D3iR
         rDrQJMmbzMggV8SlHp66y3CZjmRCuBQJXjJ3EQg2535YTCzb3ZL+is7bIUZcHP9ymj8y
         oG6KxbWRLfjIZ+Ube2EVEgN8cvIu7RKpT/befBDvc2XkEuxjWgKt7jp2/9cb2zzVIw7l
         Qvq5JBSDHC37MYyDxQ2dzREnslFR+0bGQhERlZhOjasxnlqAmteYzVbSwPzP+y7LOMsB
         JClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762361067; x=1762965867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZY2ovksieRapgk658pHLWkUZACRChu2RMh3Rj1+1OEY=;
        b=SdqQpkgKOjQXQkdUo4dOM5infGlzTu1WMPsSxZ35IsQew5cAwBt1jm8/N5AVVNG9oi
         G3r+Zhw6Vy4+3Wa4KtnKuSHQtI9k0xd4DXRe9jBCIdxsCOe0qlMaLBppNxADFTTgd2Nt
         pGX/JLWLsV/esK2OF0ITA+2TwbUXvGtPgBoxhiDK919NbWk5mlsNiI8hwDvkJdsu/MkB
         UTtcZQ/mvHDS/pxnwOOqm3678bN9RCGmNjZLEbgwg6kpSn6PmZOgPB3qefBFJWh6GaNB
         YB80XEJ/FZoEzGh+Rhm2UEAvpy1/pd551ozOY0lW6KG9+MW3XUTLJ/hoR4PqcvolIvS7
         ZdFw==
X-Forwarded-Encrypted: i=1; AJvYcCU4sy/0JqdK4cIHhpzXQ4d8zx8TR8ksWJbCRIMSKfW7Ojd9eLvITsFT89/pPsplY0HpBflHzdqJv5bBTg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/cBjgbiqPCO2rPQlygXz9UMSHnY5P2inOJyGL5LTd1UaoAbs+
	fsw+e4ht0dSf/XMs88Rtlv6etCTHciFyqumjZJB0GqYFqdJp0v1zaBvF
X-Gm-Gg: ASbGncverTg0ItERFodSMPsBvsIyH8dV3ev9J4eyPiUgYAugOVtFbGWbW9Ve5Ln7eIo
	YdGDJT3y4SjL1NMBxN8KroZ7Fgt7lKcyBM1Xnv8GFnAGRZ3F1oG8vJQpN/DO39sWs6eHn/A0Bsy
	fANHT2i8xMN9LqZG4M5P6kyynobmgvD/2aar/caF6BvnQpZs0SBmrLVi/ME7B/vaNgIpmLrschR
	dgdNiEddrpEArljAUcFBUaW/m0aeav04ELYsUUG602Y1JUVyLgesKtP1I/c0hY5crX9HgU/T6Gt
	uq8J/3Kx22KUzDSUREJ46dJ9nmMOx+XMwvQD0BB7WTthNouEUNPMuhHvKqyhr8lWKGdvTgDvqU/
	Ypjc649HydvYQRsgiwlMqYTurquWMhZXC5luyeW+rgUjq6spwjyqiAQAzA5PHhP/y3GoTdiVvK3
	R0TiNiTmp1dPl22rS8VWnAqCESfPM2fznckG52umi/x5F6mhnR+QdE9G79wA==
X-Google-Smtp-Source: AGHT+IGU8h8RqLt1fJTOpph+Kb6J+YXpLSWNisJ5Rw8ElaLdkndSmhqlDVbaDGVZcwA5Mkqog8YWaw==
X-Received: by 2002:a05:600c:1c90:b0:477:589e:6c2f with SMTP id 5b1f17b1804b1-4775ce1eabamr35876305e9.22.1762361066679;
        Wed, 05 Nov 2025 08:44:26 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1fdef7sm11938330f8f.43.2025.11.05.08.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:44:24 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>, Michal Hocko <mhocko@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Subject:
 Re: [PATCH] phy: sun4i-usb: replace use of system_wq with system_percpu_wq
Date: Wed, 05 Nov 2025 17:44:22 +0100
Message-ID: <12772271.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20251105152023.259813-1-marco.crivellari@suse.com>
References: <20251105152023.259813-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 5. november 2025 ob 16:20:23 Srednjeevropski standardni =C4=8Das=
 je Marco Crivellari napisal(a):
> Currently if a user enqueues a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
>=20
> This lack of consistency cannot be addressed without refactoring the API.
>=20
> This patch continues the effort to refactor worqueue APIs, which has begun
> with the change introducing new workqueues and a new alloc_workqueue flag:
>=20
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
>=20
> Replace system_wq with system_percpu_wq, keeping the same behavior.
> The old wq (system_wq) will be kept for a few release cycles.
>=20
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


