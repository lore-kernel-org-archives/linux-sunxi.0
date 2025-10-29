Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FAB34B1A7
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Oct 2025 16:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753632; cv=none; b=fdLK/iuaoZjQvAyeq4a+45NxcmYU1hLbV8x+3TzkzVqHupjKKCySJbefMzRVzfZiHauqnmO6ioBDobBLlyh7uIwYhO6IdrAWqaU/hyNosR88OoghOaHatU4jLnIZI5Y3FCQHMdbXlfZHOE+AOcvsj2q+7jud2ABG843CkBKGppM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753632; c=relaxed/simple;
	bh=QjbKfgzHn5tyeA0m3V5JJ3BLODA9JPFCp9Sk+QT8tK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hk1cMftz1DeRbguzONK6fZkjjUof/fEmEUxfBR6gsRMKjVUVKzhlSBEqJbYdeW03hnWpxqpAOdszBGxTyV7m5v8qKrTsOx3g8XlEyN487wiNSHuteQxp37dsd5rUGbnBZet0ppITTE3ZWwhZcqNYPka+GQ+198owmqsw2R1oz+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQ+ndh6E; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQ+ndh6E"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47118259fd8so58299275e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 29 Oct 2025 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761753629; x=1762358429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjbKfgzHn5tyeA0m3V5JJ3BLODA9JPFCp9Sk+QT8tK8=;
        b=SQ+ndh6EAIcEw0Xir76n5K+HSgXtT9anIc/M3VGus8PcAgzhOpnf/aSsGSLVuKXJMx
         l7X/ys9BoQleUuNyN2HzK0qtAfMqFQWOeJRnksFROZXbxPLc+wo13A+UG3diKgWiHgLa
         ehN12D4dRsGPyDEyVD8l59rkXbp+y/dyE0xuDSDmIeZ7/T9DYiq805iIzxn/IYS3DeKw
         y+KNI40sVpK9yAx+wk2D1nNyKODksEs7OghIBJ5SiN4dhQEJ36GPBXzNtt5FjHdlmGMB
         0OKzUL5rzJn7xwI1ronpER/rp3M7QgEwysBh434wvM91mhdh7fBH7yz8DZoWeSctedkx
         xOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753629; x=1762358429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjbKfgzHn5tyeA0m3V5JJ3BLODA9JPFCp9Sk+QT8tK8=;
        b=hzkx7zFDGpfrOxMiYAXeGYgX4g10+aPSNjK5orhvna+VoGO2QKToCgjAU2jESkpXv9
         eK4fDcjCVLycfKkoZq+b25Bpa/dDiYg3Ww6C4tiXsI+THPO3elKT8klJ/OzkH4FK7Rfr
         8zctCFWPgmcmJMSl+pnF3Z9x8DpX2pCsnOLxKqxUIz/grMo1FFaZTFIH6KKFSpo/ae2T
         cJQwVLvGQAywHTL6Oasyi5SVVgRWaRflHcq4DrrqT/qcJhpDMJSbzoFkDVr1NbL33PRc
         MjxXgCnBZ5uX5ln9TCLyRNQPx+P9eRXQGGNsLCRRkXjJFL9QdGVb5XSXfXjzBU+qEmIl
         ayaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9eymMDPf+dut/Cj6FAqAJAzsUyjhL3lp8O+I0gWkglYRQQ2AcddRNOdwVeXPBK6ZMwFdPhqZxQulqTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9/x4HH5HcTzFZWiK6GexAgg0aLlK5VCtvuNt8eI7+CoBDUUme
	rKCmA5nSvm0l+M8ZTnaLsyFou96YFYyY7C/mEf/ZNJoAlAPbOdSJrdux
X-Gm-Gg: ASbGncvu2v/Inz8QdUFymms/zJQNy9xT50UGpzbrAO5J3aeXIEyX2z5Zzp0gjUKHkuY
	fVqtMUBiej4GtHe7m/BTZJFIAxbgLUXLS1fpIbXY4UT9XvdXn4Vgz9NZsxZzaPjwzveG1lr3RF7
	hH0/hIK+oJjHuaZ2CrrE8R+3R1coENpWjWgHjsbN5UgDdnciG41Hs3nOtxFVU9BcHoSkj0LL62P
	gHVlQ3QSuRP8Ky1JMK8uCaGbya8lrgkIyMjwdG68vZUwK5ABv5njwq9BgKnlrh8uk5cBlFCOFyg
	jFxZU7Kf39sSx6odvnwDb0IQmBI64HhlEDDMiOuw5qb9kjSiHFPmLzo3XcLucg4oCXfYPJLO9uW
	4tWrN0eCLr/EGezzBCg9k+o8fHM2Kn/pgyfY6xX0J7GUs2pT29mKQ3eJojm7bbdopbyRweE9ij6
	RsQnBXGYB9DJPTIUPoWpvY5UYoAIeRswnmgHurMIgejnMCLtk4S85GIEAy6Uv4Pa+EJ37u
X-Google-Smtp-Source: AGHT+IELwKkyoHZcEXoDh+ODYAhJc1PkQChXNnF/56yRmyxyp0iQGf8PAy40wU0hq97LrnXaNPX15Q==
X-Received: by 2002:a05:600c:848a:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-4771e21c484mr25812165e9.21.1761753628706;
        Wed, 29 Oct 2025 09:00:28 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3a8209sm54097015e9.11.2025.10.29.09.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:00:28 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>
Cc: linmq006@gmail.com, stable@vger.kernel.org
Subject:
 Re: [PATCH] drm/sun4i: Fix device node reference leak in
 sun4i_tcon_of_get_id_from_port
Date: Wed, 29 Oct 2025 17:00:26 +0100
Message-ID: <3848160.MHq7AAxBmi@jernej-laptop>
In-Reply-To: <20251029074911.19265-1-linmq006@gmail.com>
References: <20251029074911.19265-1-linmq006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 29. oktober 2025 ob 08:49:10 Srednjeevropski standardni =C4=8Das=
 je Miaoqian Lin napisal(a):
> Fix a device node reference leak where the remote endpoint node obtained
> by of_graph_get_remote_endpoint() was not being properly released.
>=20
> Add of_node_put() calls after of_property_read_u32() to fix this.
>=20
> Fixes: e8d5bbf7f4c4 ("drm/sun4i: tcon: get TCON ID and matching engine wi=
th remote endpoint ID")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


