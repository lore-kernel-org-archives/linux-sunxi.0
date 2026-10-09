Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961D43128DF
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Oct 2026 16:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562472; cv=none; b=SBAYD5T/Mdn9ObpykexWtnbdYSUr44t5SL+ABFBaCIfV0Xct9j9m38ciofZquWmUUzngioK4+JdtvxXbZJiWN2L+i2jzs1ixGVQp5MQYin3lW2cR8PCUFwuqIf/TOK1+aXWbUCuVUHk0n/jPkYB2FLpd8Bsb6tAUba93ws3vB9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562472; c=relaxed/simple;
	bh=Vcn4NPPUw7msa5Ka/ooKHnLzEl9KExl9mTsGAowXuHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IaIjJAVt86RPsrBpcRONaXal8b6VrlRf/gP4d1aVSiqeubaF84ZjZXyn5siRbDrHbMMlWgkJbISxtYWgejXncSDs742TU4l6Uug7Q7o7EA7zrySAJ87cggwBdY++OokzWVihnl5ZC2ObQD4f8G+FHybg+pP/RyjYO74dZy84cBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwUGZG/g; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwUGZG/g"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc502d509c0so2735392a12.2
        for <linux-sunxi@lists.linux.dev>; Fri, 09 Oct 2026 09:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562471; x=1792167271; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vcn4NPPUw7msa5Ka/ooKHnLzEl9KExl9mTsGAowXuHc=;
        b=IwUGZG/gg2VBYMQUyiHIoohuHGLnFOO++iweLxkLRLLu0sFvTmt3thZcqQEZJi6Ak7
         GIjJp+lIK62nmq2hYXFmFa9Nfy1Gcs8OdhmRNi2Tk88+nabZSXfYUsTTX7enRnG/VEg7
         wikuggcNZ7Pf9T7elyLFHGLLPV3ng4ZyOEhIT/vwxPvFdLHreUjbxFxN8I0+lsSzkyoo
         htUVUc/NR+T2lf+RaT/rmQotWA+XmosE8GCEFsfrPwxuDGUilbyOd7CaQ2Vu0f/7YLhM
         T6UIHX1ME9crlp+flWmGHUNSOr61M6nX0xNHogGKbGLAE0QNobAQcg77oouHbzpI1XtR
         Nz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562471; x=1792167271;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vcn4NPPUw7msa5Ka/ooKHnLzEl9KExl9mTsGAowXuHc=;
        b=1hZljDjYzRqxAjfXwp1Ej0VMFkOIjpQRF/rqIg7GsT2YjjPlNarujtJgiXuu5vrvaI
         Q7tYyUDuIDtAxqKeAMw3uUgUx1DAgSWFiGHkFWnu0p8tWEXOJlwiQN1TdBQY3TTYkCkZ
         MNUZAANVWYObxeCcOvml8ofm/CiLPX4lw4dbSReDqslIyg6rx22VWqAck6rziAi7DIAz
         1BX4ozvL5tVVUPhMhIls8rOG7aS1DzBwDREP5h3IjU1BY5w26wcW4I3K7MHG6+1uGQA/
         PrNH1VNa+fw1Zz7wLeK8w02hUQszm622KtDons65495w87RHJbXI67k4Fx5OQkVDqQZG
         gdvg==
X-Forwarded-Encrypted: i=1; AKwUvBw1LCa/HWKodA+0O6Jg+Odg08h4GKUAVWG1ct18necV0gLetoPsr6vjnEXRuWnA9KwN+qRDXGnTW8L/gQ==@lists.linux.dev
X-Gm-Message-State: AFuF++md4jqh0ol6E1JE7NHe3eROBTY/Dz+h6lKyf6PlOb7Ofw2FRqAU
	cOnIVJubHZNkoQedDVSldIUk1MxskfCa3qqqosYfKd9R99mQFqpzZfWe
X-Gm-Gg: AYBFou2F+59efR92r1M+2LTltn/wWOh1Q/eVIYq+LpDdesmDFKjHUIXsH4BBwQziEYO
	QW/8ZQI2Rh9bByqEKJP9myBavANTz9cpOdM+7aKQ4iPs1MJAKEiI8x6pAwOhporku7AxMO9m233
	e6yALpeLiCNsjHEeksbx5H6Xx3xBn6Gwln82ucgUZgQs4zi71G95RgGMKlY1Po8BG0nURvW/zyT
	cnK77wwGPc116wa2/++SeRbA7jzFp0+FNWV4OvWZHrKYHjDYPMJGnngIEb+iaXUZ2E5n8sUsd23
	KQrvWs9zWaklSo6LDl1muDg07l7OS86MX3A0Eb6E3e3baMrVCjU8rn52fPD1cMWiUzE+Em2OsIS
	QSOcb0sc5AdmyqzL38rnfEUAaca6Rrt8mrh7unjLfDC376Q6//u+4eUiKcxrH7rf7Tu0nuO8dCZ
	rNyOqvjBPgtlmNgKp66RPvxuVIu8Y3/7hPmTohhYZm/SfXoATAUqQ9jdWM+c5uRJfALRv/vw4ot
	flOmiXJjrGm+eZw4JkHbwJEZAlI+vEHiBmBV6+ytyCfuGXNCuSqV+3kEofJ8ZbPPec3OUH48Cl+
	TFFzkAk=
X-Received: by 2002:a05:6a20:9c15:b0:3e0:bbb8:bbdb with SMTP id adf61e73a8af0-3e16be9eb80mr2032774637.47.1791562470854;
        Fri, 09 Oct 2026 09:14:30 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c43ae1d3sm1355530b3a.48.2026.10.09.09.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:14:30 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Yixun Lan <dlan@gentoo.org>
Cc: u-boot@lists.u-boot-project.org,
	linux-sunxi@lists.linux.dev,
	Jagan Teki <jagan@amarulasolutions.com>,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <contact@paulk.fr>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 0/9] sunxi: Add support for A733 SoC
Date: Fri,  9 Oct 2026 13:14:09 -0300
Message-ID: <20261009161409.256732-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3f57db40-a604-4800-b15f-2d159a3a5ca7@arm.com>
References: <20260113-01-a733-soc-support-v3-0-f19dcd098f60@gentoo.org> <20261009120356.194364-1-vinicius.eduardo.pedrosa@gmail.com> <3f57db40-a604-4800-b15f-2d159a3a5ca7@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

Sorry about the wording. I kept repeating it to give context to people
who might be reading the thread for the first time, but I see how it
came across. I'm building on Yixun's work and yours, and I should have
made that clearer.

> Honest question, is it really *you*, or is it some LLM?

Yes, it's really me. I've been working with embedded systems for many
years, but I'm new to public contributions, as you've probably noticed.
I do use AI to help me research tools, handle some tedious tasks, and
improve my English when writing emails. English isn't my native
language, and I sometimes rely on it too much for the wording. But the
hardware work is real, and I take responsibility for what I send.

> Why not? Probing DRAM is somewhat the idea of that routine, and it
> should restore the previous values it overwrote? So have you tried
> running that?

I haven't. I was concerned about overlapping BL31, but I should have
looked more carefully at how the routine works before ruling it out.
I'll check the probe range and try it.

Understood that the FEL workaround is temporary, so I'll drop the size
header idea. If it's useful, I can test your U-Boot proper series on the
A7Z when you post it.

Thanks for your time and guidance.

Vinicius
