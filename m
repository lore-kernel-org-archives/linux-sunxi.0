Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59DF1E5B72
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761583929; cv=none; b=UuC7ad+2BrLeEaZWKrKVXNiOikbVMSJaliKKcORumsLoqofjdcnw6tDlaPT6D+UzupN7soPk1gj54odG9Q28GKhYvC3uIdDFzto5Gv6mnnriLKhO1Dx6zJhUFECwB0JWhBX/WryHdH+TEpiFhYG2N03vxN3idB79r1Vpf4FYPFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761583929; c=relaxed/simple;
	bh=qXSUYkzcaxBwT7PR3VqEg24D+wripCaqvcwPYVLA5qI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gleLdXLUbtwRUam1dccmSCklDowZN0O88w8etsrgIK6WBcO1+xIdmz0S0Yb3zYq0NpvwJpGlhRDHQ20l/o06Weqyhbt5ry7jr4Za4OpEF2Xkcm/hxf76kHHwJz5ndERfEhbRERqYqc711UvGUin78gt37onFthX0+/EpEP/tmkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iwct5VBP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iwct5VBP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC72C116C6
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 16:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761583929;
	bh=qXSUYkzcaxBwT7PR3VqEg24D+wripCaqvcwPYVLA5qI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Iwct5VBPLz0VkdkDSWA+HrPfq9WSIDgOiBU1SFjAF1AcNrlIMqb/K6BJEIAGdqnDo
	 nSYm5SFwJ0O3gfuFSQuRtXlC8uvgpY9QZVV/RqPJlFRUdoiTZ0OKMcG76JmTNCyhtL
	 WbbrviiIdewI9HQpiX1ojEqgxxlwT3YuG1d1NxPvTzKPrix72aQsZI6VhdLrmi6S6V
	 FaOb6ftKOOF809X6BKto2rZEPE5roKhFJmZ0V3/pOEkikBV+jYcTxfhbXqLmYjhBzV
	 09iymB7lCmWV2jWUt2Oiacanu77v+Gm2HVuxvqIRJc/VbiYEJ3g63piplTXo9niAXS
	 PDsb9hJOVP+ng==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-378ccb8f84aso52453431fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 09:52:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1bghuCA85w+yiw3hAq8QYEVBZmpbmCi8mV4oItgaelMzjzH/3/zM/7DH4hyV0wU9/62eULCuavXwvgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwV/sHS3b2tPl8j0/AastYzXsDuyJWmkbgalUMMWzN/2s69zhGG
	SyrBOV1QGE4QYslKt9ja9bzurUUBKP7pKayBRvywV2D6Pau9oDpbnykofbijramllN7Et42AI2l
	FIDIg+e5csnee8zoOGO///vQKPZjASAc=
X-Google-Smtp-Source: AGHT+IFBPJYi1S4vop7Gb683MwdHCr7hm0ZlNxSJGBcGt42mr3LXF0sb06/EOe6oCAtgC1Lcmldr3eesncU595uaptE=
X-Received: by 2002:a2e:320b:0:b0:36d:1f0e:1c02 with SMTP id
 38308e7fff4ca-3790778cbc4mr742181fa.39.1761583927610; Mon, 27 Oct 2025
 09:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-13-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-13-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 00:51:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v66hnO5ZQHR8US=TdCY=o2TJRgntCDFonKY4=aQi69oSBg@mail.gmail.com>
X-Gm-Features: AWmQ_bkqru6Db363dehTH0eyDlHZatRKL_5iBGTqBIvG6dXZWDY255VHS1_NOZM
Message-ID: <CAGb2v66hnO5ZQHR8US=TdCY=o2TJRgntCDFonKY4=aQi69oSBg@mail.gmail.com>
Subject: Re: [PATCH 12/30] drm/sun4i: csc: Simplify arguments with taking
 plane state
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Taking plane state directly reduces number of arguments, avoids copying
> values and allows making additional decisions. For example, when plane
> is disabled, CSC should be turned off.
>
> This is also cleanup for later patches which will move call to another
> place.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
