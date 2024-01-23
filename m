Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7490A538D
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 20:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706043464; cv=none; b=LNJ/5qmIeSHWEfvEaS2r4lg8pE5qgj8QQpOzurxik7Bzfu11cNqw0UznCYwSZaW5j12dkZGjzy9AYTbuIOZ6/Zs3VDMcHP6EnfI7FiPDkEY7/TZzEM8z0fCNXOSSb7ce7aBPQMJOhl39mQOTgawSa146AT+TEjJxAZevU93Zm+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706043464; c=relaxed/simple;
	bh=LMHI3ZyKjenRYrlE+O2xcbn5Ctiz1JUEBKIqeCuDgSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VZY+EtIi9nKBVxh72fiaQnEFp7EFgIL0QVmBDyGPjXwES4hGVk6oIQGc4qniYwVnnGtaXwhbFh+8oG0YZtUGHMKfg2LelBZz6fbgQM560uYy9GCs5GQ+uMQG7Z17PCA9JdHhMmZ1CvFrZbTmbbtAdnmm/ey0OGppAQ4+uMuDfvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mr3MEN9A; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mr3MEN9A"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3394ca0c874so85340f8f.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 12:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706043461; x=1706648261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMHI3ZyKjenRYrlE+O2xcbn5Ctiz1JUEBKIqeCuDgSk=;
        b=Mr3MEN9AH+f9RhoNBfbaXhUNQ4V8ChT9sh47h+aHuiYNDxgIQDtZk8bRJvNHZ0CCjw
         GPdZIIwRr9CBtwrafnn2ibwIibgoGEmm2UCD/IG0megU+n4FLKd7Z+HfihD1au/sUqM1
         URdDV8MhQmyWJ6eAEXrkm+4n3h+9z5gPAcAC29Y/jJgLckewPc4RaSL1jusZ7YdptYJU
         MD7kjDMlcLRIYjk2rAa2ZsVMS8ibF6uJG9Ge/CY1BzTABjkfUmwCJx3CRJGxL1msfvDD
         eIaGoDJZYatP8qh3vnQL7VnSUGaT9iQAVnwaBmsL5RXPZVyDMmfFqNthReAvzxs9PEjl
         mOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706043461; x=1706648261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMHI3ZyKjenRYrlE+O2xcbn5Ctiz1JUEBKIqeCuDgSk=;
        b=e81yLxQ5eyf6XpvoT2faPSSBYNTlcdSbCoF/AiorokJCEN6LmVZaZ7d9JG9lc+D7Jq
         Qkchx6DPF5iPyfDOMpZf/VKBGXmlFqY4GSn2WlGgDc80zWTpAi1thgpowcn6HOOwPTSh
         /dACEhkFQCKR/ZxPE5JCJvqxzYEvUFCHQdJEBWvtjeKYEmCuVhxIhyyDqt9JHx/r4tQs
         jbsJ3SJ1Ukkbb6SemNH/h6PnFS63RfOWjEWLno55F7jXuei7N/YBAspi2KR9JFsfNf9U
         AjJqdkIlgzU7hjRUE2PavKyjtBryRCyVddw3PyNWNCd1Kk0AbWDzTRXDBoKPwZwGknG+
         nHFg==
X-Gm-Message-State: AOJu0Yw6YsSwMgwT37VN8vfAHHgoNSeer5SVHvJk0LEtQwzR657lUDCp
	Widuz9Bcb71q/2OgxJNU6oyd2cEGwBGTjV4wCeJdLDqswwqWSp1H
X-Google-Smtp-Source: AGHT+IGyHltPBF01PYc7KGvL0FOhunCwSkDUTKurU5YPs5tT3eu+XinrHNV/4/LQKm1C0hTJ+Jh5Dw==
X-Received: by 2002:adf:e58f:0:b0:337:b56f:caf0 with SMTP id l15-20020adfe58f000000b00337b56fcaf0mr3889646wrm.47.1706043460423;
        Tue, 23 Jan 2024 12:57:40 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id c2-20020a5d4cc2000000b003392d3dcf60sm7986180wrt.88.2024.01.23.12.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 12:57:40 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clk: sunxi: usb: fix kernel-doc warnings
Date: Tue, 23 Jan 2024 21:57:39 +0100
Message-ID: <5906747.MhkbZ0Pkbq@jernej-laptop>
In-Reply-To: <20240121051858.17647-1-rdunlap@infradead.org>
References: <20240121051858.17647-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne nedelja, 21. januar 2024 ob 06:18:57 CET je Randy Dunlap napisal(a):
> Move the function description comment to immediately above the
> function implementation, the add function parameter descriptions to
> prevent kernel-doc warnings:
>=20
> clk-usb.c:80: warning: expecting prototype for sunxi_usb_clk_setup(). Pro=
totype was for SUNXI_USB_MAX_SIZE() instead
> clk-usb.c:91: warning: Function parameter or struct member 'node' not des=
cribed in 'sunxi_usb_clk_setup'
> clk-usb.c:91: warning: Function parameter or struct member 'data' not des=
cribed in 'sunxi_usb_clk_setup'
> clk-usb.c:91: warning: Function parameter or struct member 'lock' not des=
cribed in 'sunxi_usb_clk_setup'
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Emilio L=F3pez <emilio@elopez.com.ar>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev

Merged, thanks!

Best regards,
Jernej


