Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A523195E0
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Nov 2025 15:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182894; cv=none; b=og8oeZvmfkopdVaLFjJ3lTrQnSdywOEBCLeAAED+tOkbxn4AmAJFfKiu0aDWgc/+rSqAoNnpZ+RZ51TVLtBWzPmSjRYhcisVAH2GzQLD6rDIbgzWeXqW45gvztwsn6e8r5ECJhxzjDjS5v9jpsByQpDPMZHvI/W/SAB9Oxepu8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182894; c=relaxed/simple;
	bh=X1lQDIOUYsjBlo4ocs57kAT3XVTll6xW8NP/rqlaXgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nqHGt2NaUILeQEVPnvVY1/EaFZ2+Ti0jaxXPlr0iMzXHCdtYT+63IzZLN57VP2sCbdCaEag6XoPxktVNQwBLYZljmNAop589ktnsXpekk4rsyHl/g+s4qz8m4L+tktsF1KmxaqU2I7sPMB2xGD9MswLY/qiN8ZAwWjY/V5ZNbCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9DZanYu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9DZanYu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261D1C116C6
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Nov 2025 15:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762182894;
	bh=X1lQDIOUYsjBlo4ocs57kAT3XVTll6xW8NP/rqlaXgw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=d9DZanYu1Du0MYDLUS/92X+Uwvd7DmItGjVLn7l92ZW9DEUb8dEouTlqUwbuYBZIG
	 pH1gQX7ZxOuFzhDCHe1s9G1KSvbw67fwVhKmCxVsahiM4x5/rVqHu+u0zq2W8ODsoz
	 WJKUcHd5pr5oqkT/iQb5R4T4g6WV2iAa1ZTE1eSPGtr4DTB6shuHq5kXqIQZd1KCoy
	 Ncb+AIiWy6F51l7Sq/I7eO7jQ7OQXP2ga3CqRE2OYEinAFBBmjD7g9EP+9O7cTMeDs
	 JLxEmg5g4qWSllg5lno1JojlPBPckXZm0wq2CI5DsZSfACxyfyaUpu5nVc7Vg9Fqyq
	 bGk2N7GSrgBCw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3737d0920e6so28076011fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Nov 2025 07:14:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWY99dD80CDbIm9OWKkvc7TW8x7cFgfDsK65+7gTjAAxJUvBu+FN1R5ZNc1tVU0l+oERUTLvmp9ubfGxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbHpf19zG20PfO8upluWu9g+QldUBaRQnzZ5Bv2Du5A1Ak5qUR
	Hhuy2qpulyQhMM6Yym9zv6Xv/UeVt8XD+OFEWoL+A8SN7PhmI8j/5xidgThQARLFVbFOHAFaQqg
	/L2bmfyv4y4QH6Z3ac1OI5sE8qIcs6lg=
X-Google-Smtp-Source: AGHT+IHZDkoXxNdhZHooF7In6ZS/umouiKh+BmptD052LhPp+RR7HY7bCHqMPN8dvQ1n5W4zzJk3EOAaNxVFM3Xu/nE=
X-Received: by 2002:a05:651c:b11:b0:37a:2c50:c437 with SMTP id
 38308e7fff4ca-37a2c50c5c6mr22032461fa.14.1762182892512; Mon, 03 Nov 2025
 07:14:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-21-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-21-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 3 Nov 2025 23:14:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v65ubpB5sKnfQVej3AOtNSX=xAfh+RDL+=qZ3oz0j8-rDQ@mail.gmail.com>
X-Gm-Features: AWmQ_bk5XxIurfQd85eS3oxbla8XyM5TbCCjYCsGGsUnTgr3dnC2wC7GmAAQMwA
Message-ID: <CAGb2v65ubpB5sKnfQVej3AOtNSX=xAfh+RDL+=qZ3oz0j8-rDQ@mail.gmail.com>
Subject: Re: [PATCH 20/30] drm/sun4i: layers: Make regmap for layers configurable
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Till DE33, there were no reason to decouple registers from mixer.
> However, with future new plane driver, this will be necessary.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
