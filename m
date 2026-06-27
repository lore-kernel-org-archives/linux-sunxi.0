Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024A1314B72
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Jun 2026 06:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782542913; cv=none; b=m+iIPWF6Jpcg/7Zs/jbvU0kIJCaJHQ/7ZHGG1f2EP+Vd7+WGXj3WKn+WCTP3YBSX5OqH5E7Q7FwMHmIlN+IThZI2ui7wSpbDOOS7GjaAWCSA3+uDX8WHWQ+OeH3xhxPOllHHTiSUx0ai7SoQEV7B8POuQXb45WDCW5UKJmf/5D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782542913; c=relaxed/simple;
	bh=+rYfEs2pvBhx7gYc578DZEus3ro6qJzWud0f6V2w20U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i7m8PdbmpctNN4P4G1yGheGI6gfi4i/FZRITDHZqVMUgGthZ7ICnP01Z3dTx7mOzMGUGzV7ZqjuqlxZXoHXX4lpDnuz8/ZvCyQIP6NoZGLL99bfJvvUF8I81vOjb0MZ0meEO4EFlUMxKTvyBqSiJaWqj+e2DUgTehwwHBNcHiU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRZVNnDk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRZVNnDk"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4938d60c035so845465e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Jun 2026 23:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782542910; x=1783147710; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rYfEs2pvBhx7gYc578DZEus3ro6qJzWud0f6V2w20U=;
        b=XRZVNnDkuzVGZaJNmvOhQ0hpRn6porcwMLvfXbJtk+/HvGabVWRMgAE23ggYMqKrop
         JytkikhofE0hToKTAGJr0/zMGMDwWLsZoYuYTF8fJVB1K+yNOlr+GAR28i1AN7z7+puy
         QpV8dyOesyv5agZQy0WDDZrQ4n7Huibj8sM112G4Mt6SkrksfSVqw8eWXXhnIgUKPlzf
         3OyThwCVWn1jgXZOOIGULkW82PLxd6QymY9aNkBlrVBLmenk1qoIlkj1bf6OscY11eLr
         1GVOu4rIndd8Gg86CHpNp42k4Zf6cguZielOt2crhOEnbRrrAoAjW6y86Ea32hmIhSO9
         188g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542910; x=1783147710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+rYfEs2pvBhx7gYc578DZEus3ro6qJzWud0f6V2w20U=;
        b=C8c36VdJHEHcu7A6tIqyWKrfECXsaFXpw42r59yMIDwYycGaKuHFoPGrxPhAkYys8b
         BeZ0P+qU81LT2/tjBodZIuyFrHAuylc173RuERdtZZKINFUoCDY6Yv2fWlDXKLLqWetq
         V7tvGLfT5omWVIBLLudsqiiOWmKmBlI37KZtY/ZfZQhF7NsnoGKXZ+eXySxKyqOo+KbL
         zrS5fzZ6l3mo6smShPCzGpseGV8V26Jkiaok7MfsXqSP+ek4E5e2dPjy6cRmPQXNpeN2
         +SHtjEUglilevumo819uCl0cnWm/VuZqLmUmp6JVEFyPvs0d69qFi5CIzI4JtUfYLcY0
         aWuA==
X-Forwarded-Encrypted: i=1; AFNElJ83C0S1p/5vyGsYkAxbZX0Y8SyOo9as046lHw0ME1eFTES0NQUbbQIaXb7CyZlS7QWHZGwqdzpKhaAgVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YygVd3fuOzpulQQwDxsAWD+X/xWdGKMdQlIg/DoU5wZ7s0slZ6H
	7ekmy5NcyXmuOQghYiNYYNOphjCbbIx4o66moFSZ55BpRkiITvAw5Cd+
X-Gm-Gg: AfdE7cnGw1EloFaMaV/M9Y2H/Ejd8X8d1pVOIRAJkm4ICiPOrZHANH/oHCo1ach3DE+
	vLXmT6SVJWZ+gUHso7lC+VW0zSMgGnD0USJ+QsRg13O7H5J955J/TstaLafRduU8xoOvD74hs57
	NJgqiXlH81jhnbYrHy4QONWAt5PfEM/Lx5VVjMYNPWLIsXzX6dOOb6e5AYcGrPhbW2PvZt8WA0s
	Z3FG8RQ9zxRG2kx4sARFAUUL7dydEm0Xa9JfKP7ssTBU6BU/czQRi8XDBy7WSI8o9txNCqcWifk
	PXME0Xj0GhsrBwQBljW3fwKY7RPP44nUiavcwSavT8a4/2Xmup6xTOfcy6jkh7YEW6uOXroyOK0
	zyJ3J4e4iCdG9gFKf8gKxy35c+JJQ1W5QqeAYjjRGT3o/bZTm+XwxO2WYPQreIKSksHKa0QUA+4
	RHTTtzV22uh5m8rigBUnICJGUIYr7JLXCcVi8NQA7sfQrc00sYXEXbxGwx7F9sx23D8Q==
X-Received: by 2002:a05:600c:1c17:b0:492:7019:caca with SMTP id 5b1f17b1804b1-4927019cb17mr63681665e9.26.1782542910213;
        Fri, 26 Jun 2026 23:48:30 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46dcbac0c9dsm22289931f8f.19.2026.06.26.23.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 23:48:29 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: daniel.lezcano@kernel.org, tglx@kernel.org,
 Felix Yan <felixonmars@archlinux.org>
Cc: wens@kernel.org, samuel@sholland.org, indrek.kruusa@gmail.com,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org, Felix Yan <felixonmars@archlinux.org>,
 stable@vger.kernel.org
Subject:
 Re: [PATCH] clocksource/drivers/timer-sun4i: Advertise a real minimum delta
Date: Sat, 27 Jun 2026 08:48:28 +0200
Message-ID: <cyKZfOi8QVGppYlWqaO5QA@gmail.com>
In-Reply-To: <20260624220434.4183732-1-felixonmars@archlinux.org>
References:
 <CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com>
 <20260624220434.4183732-1-felixonmars@archlinux.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 25. junij 2026 ob 00:04:34 Srednjeevropski poletni =C4=8D=
as je Felix Yan napisal(a):
> sun4i_clkevt_next_event() compensates for the timer stop/start
> synchronization delay by programming evt - TIMER_SYNC_TICKS into the
> hardware interval register. The clockevent device currently advertises
> TIMER_SYNC_TICKS as min_delta_ticks, so the clockevents core is allowed
> to call set_next_event() with evt =3D=3D TIMER_SYNC_TICKS.
>=20
> That programs a zero-tick interval. With oneshot/highres/nohz timer
> operation this can leave the next event stuck, which was observed as a
> boot hang on Allwinner D1 after the clockevents core started reusing
> forced minimum-delta events.
>=20
> Advertise one extra tick instead, so the smallest event accepted by the
> core still programs at least one hardware tick after the synchronization
> compensation.
>=20
> Fixes: 12e1480bcb49 ("clocksource: sun4i: Report the minimum tick that we=
 can program")
> Cc: stable@vger.kernel.org
> Reported-by: Indrek Kruusa <indrek.kruusa@gmail.com>
> Closes: https://lore.kernel.org/linux-riscv/CA+fTLhgLmTY+exGujKf8OYYQvcEW=
5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com/
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Felix Yan <felixonmars@archlinux.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


