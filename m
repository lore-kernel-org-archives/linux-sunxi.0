Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8482185AA
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Jul 2025 15:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753717336; cv=none; b=D/WTJ5zOEruRs0lcLJX6YTK3tZ6998/U9ZF6ZtnUuUBto41bamkwPfWGlWeEOkaD6skmOwOigiVsiwDVehSMVdI6QOlr3gkLOfO3kE3aSCemX9c6GzQQ1IYWL/2/nDp3VulLz63teipEgXEmh+hwRfBjSQAwLvwsNagSZvoBaUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753717336; c=relaxed/simple;
	bh=uzaiR/0hjuzAwH/jGiV5YLQlsRDmWEwfUksNwODtDDU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JmIoYL+xbcXOacEpEusDl3n4XDWSBd33WjpQVhcHbgYT2lJgSPp0MGKzujccQlfWFSasF2DlEpFZ1dSc7Nd/UqL6ohYPo+OH4NJJso2Zl3sy1hQfKz00k+jPjpYQEefPKXOcRwrGI79395BbFLWf7Xfxid8s8MVkAH0jS6EO0WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=NWBYZPtE; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="NWBYZPtE"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-73ff32d8b8aso856912a34.1
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Jul 2025 08:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1753717334; x=1754322134; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlLDF0pLLn8LnA2cmQjtNwEyK+bagknTXBqDwdIP9Vc=;
        b=NWBYZPtEp1Oauv75QzwR62JFMah61/cTBy9B8j6YlqHhzuPVaBnc3lcP/e87Do+e4q
         Erk1hbISsNeEbYfwre72L5hS+ZOu18gVz0a+lBkTDHvFeYG/ipf5FhlbRm7b+CH0qkrH
         1kBs/hb89lxFznFxdvctfzCd90jWu6NY8pr7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753717334; x=1754322134;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlLDF0pLLn8LnA2cmQjtNwEyK+bagknTXBqDwdIP9Vc=;
        b=er0zwKl1N5hvEqB9zyuieKWa04yFD/iMW6ebA2lDXcG4f57zO6ihfS3z9s5ImpDMla
         AOhq2hMViZAZLgvQ0EZGE0q40uiYL98eqdLbJ/JI82NUTBQ3PWeAIquwBDSrzdO7L+HF
         XkyErBICg9Y1v2JU0WJxQuPGuQZkABVMefqjgmEEbk77WwhaAxU0URyxwXBjMOSilVTR
         dHRT+Z5TN784EWugwugtD3am4eph1r/OlxqiTfl7BA9WWFNwhb53yFL93mxcVSkq1SkN
         KbUzLy9A/MVD1ghP4ofp8PLHPlJxNXF6N01lBdRNXdlv2E0gvPRw4T8Wb2NxsGxFyx1M
         kwrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR4j/QbTkhcfSXJlHPotfMPG2r06duyUegwk0aLB66fFtqdfmvPgdeIyhIbLp2sNDPOACB+cLsuy8g5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzG6YSDWREoPbWsUgHPNNLN8/fdLoWt71P/ftIsxSkDW/frxnVc
	+obQMcIvIE3+Qv7PRmH4a/y1CP+Ud8MqBHF0Jpa83mnBsu806mfcztCfO94n5cd8j7c=
X-Gm-Gg: ASbGncsykv82udXF276IcugHA9DmqNZ7o+DaslYL3V1fi/aykjLmdUpj7rDBPScnq5F
	O+3SYxsQJskXndiMVFF/P//0wbE2uz++v08it9ntOObay+s0ayokLaG/iM53/D/whC/CLrFvNYc
	nCMenmKXXS+slvGBuO6iFEq674s+Fkul5hY3ERYHMmpCHGA9nDFgFr+fWVq6fMrbo3lae/8S9bz
	t8Fu+oiyaHY1NOjXFq9vGPKL0YCXQl/l4At0ZIMqHsTgDZDlrs3589NmqK8TAZPmRkmk2D8pnZi
	+szfKONaI++NYLx51ztDSrgMYhzpG+YwQOFV0UlPFr9uVZ/Af+Vil3fGj4gMR2V06EZw5FaJc3p
	30XMHPPO7sC2aicWo6yCPpAEYwjfXLeb+EAAnexJv/mVSvE0u3kRIdUk=
X-Google-Smtp-Source: AGHT+IHXlamr9Lxjnj3UEhb2cZW5quwnwm+1jsA5KKz9BXMb/YqrV0/vDkUUfwtbtreOGKDEAiN5KQ==
X-Received: by 2002:a4a:e903:0:b0:615:e61d:2dca with SMTP id 006d021491bc7-6190c944cfcmr7937886eaf.2.1753717334171;
        Mon, 28 Jul 2025 08:42:14 -0700 (PDT)
Received: from [127.0.1.1] (fixed-189-203-97-42.totalplay.net. [189.203.97.42])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61913f4f177sm1015128eaf.7.2025.07.28.08.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 08:42:13 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Mikhail Kalashnikov <iuncuim@gmail.com>, linux-sunxi@lists.linux.dev
In-Reply-To: <20250728004516.19032-1-andre.przywara@arm.com>
References: <20250728004516.19032-1-andre.przywara@arm.com>
Subject: Re: [GIT PULL] u-boot-sunxi/master for v2025.10
Message-Id: <175371733338.368338.4272008367229350972.b4-ty@konsulko.com>
Date: Mon, 28 Jul 2025 09:42:13 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 28 Jul 2025 01:45:16 +0100, Andre Przywara wrote:

> please pull those sunxi changes into v2025.10: they add support for the
> new Allwinner A523/A527/T527 SoC (all same die), alongside with defconfigs
> for three boards using one of those SoCs.
> The patches are the usual combination of refactoring (of the SPL clock
> code this time), tweaks to existing drivers to support peripherals in
> their A523 versions, and new drivers for pincontrol and clocks. A big
> chunk is of course the DRAM controller init routines, many thanks to
> Jernej and Mikhail for providing this code, after a big reverse
> engineering effort.
> Since the DTs for the three supported boards have been merged into the
> kernel repo recently, this is concluded by cherry-picks of those patches,
> and the defconfig files to finally enable booting those boards.
> 
> [...]

Merged into u-boot/master, thanks!

-- 
Tom


