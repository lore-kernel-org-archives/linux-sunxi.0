Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A521381EB2
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Jul 2026 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784979820; cv=none; b=prH29tn2lJKOX6gJEA+NucYM6JyJ3Wwk7nfabvm9qLNdNVUR5Ek6OD6A0QaByPcuPJTrIrMyJEK640YVaz9nkgNWHNthmGPICgGH8/IoLx8Fu/ql16rudW5S8Ma8Pbw3vGohP9BvpuMnaifehoFo276e/R9CePM8c2V1HoJrmAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784979820; c=relaxed/simple;
	bh=4LESJuEvl3TJ3Y7Sd/vgiDgEGn8HHXHMLOf8l9JpPUw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IIKPnFAEZOWSgsEddwTHC2GdeNlUGvvQiLgOXUGYqnfncOwk75K8/zmuxjW9SH97lmFt9vakUSeb9tOJOuzozyRWvTUZrpIn+Yg37qPY8r4thkyf7QByzOkxDC7v9qyFDTR0jBKEuYvpOYXA8qChDZzVcBJjhQwhtRhqjxeKhEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzMFL60o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzMFL60o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E801F000E9;
	Sat, 25 Jul 2026 11:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784979819;
	bh=/eT58PqTLuo4fGvRJo9I0yCs2bkKFJLC2yOY5muW0MQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RzMFL60oqKDCgZaF0WvmEvO5GPZt/dVP4HjY4+IEBSYQCm5p/ygKe/W2ODo9+Ol/H
	 IBuH/XPtFSPblpqGUNMX1mE6ctMxWiFFWaHuVzmkjAkFkpmCzfW5UU2m6hhctMA1Vr
	 KrSb4t0FsCyoWv4xkkhlqSHTlDH7aNd13BFd4TWh5nzikryBconvwMhiYDsz6te0HM
	 WAtXzvUFB+HUAjLTscSRLX5y2E7VE600mODU2OeD5fyAKqX21Oj0Pw/dtwDkdapmwN
	 sHwBenP06JRgjUeKJ7FW07Y8wMptA+b2IPFdwdeSQdhq0Zm1EKy2dk85+yl4OTTDlQ
	 UgGJN6yR6h3uA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clocksource/drivers/sun4i: Wait for pending reload
 before CTRL write
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?T25kxZllaiBKaXJtYW4=?= <megi@xff.cz>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260725113341.2250687-1-megi@xff.cz>
References: <20260725113341.2250687-1-megi@xff.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 11:43:38 +0000
Message-Id: <20260725114338.D9E801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the same hardwar=
e limitation where writing to the control register while the RELOAD bit is =
set causes the write to be dropped is unaddressed in `timer-sun5i.c`.
--

--- Patch [1]: [PATCH] clocksource/drivers/sun4i: Wait for pending reload b=
efore CTRL write ---
commit 936f66d7fd8614d6358ab1a1c7241c4675c9fff4
Author: Ondrej Jirman <megi@xff.cz>

clocksource/drivers/sun4i: Wait for pending reload before CTRL write

This commit fixes a bug in the sun4i timer driver where writes to the
control register are silently dropped if the RELOAD bit is set. It introduc=
es
a polling mechanism to wait for the reload bit to clear before modifying
the register.

> BTW, similar issue will likely be also in timer-sun5i.c but I don't have =
any
> device that would exercise it. And it's possible that this triggers more =
easily
> with CONFIG_HZ=3D1000 which I use.

[Severity: High]
This isn't a bug introduced by this patch, but as you suspected, the exact
same hardware limitation is unaddressed in drivers/clocksource/timer-sun5i.=
c.

Looking at sun5i_clkevt_time_stop(), the unprotected read-modify-write of
the control register occurs here:

drivers/clocksource/timer-sun5i.c:sun5i_clkevt_time_stop() {
    ...
    writel(val & ~TIMER_CTL_ENABLE,
           ce->base + TIMER_CTL_REG(timer, offset));
    ...
}

If rapid back-to-back scheduling of high-resolution timers causes this to
be called while the RELOAD bit from a prior time_start() is still set,
wouldn't the write be dropped, failing to clear the ENABLE bit?=20

Since this can permanently stop clock events and cause the system to freeze
by halting process scheduling, should a similar wait mechanism be applied
to the sun5i timer to protect devices that use it as a clockevent device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725113341.2250=
687-1-megi@xff.cz?part=3D1
