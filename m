Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BE9319864
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761585314; cv=none; b=k5YGk2URDO3yEgOIz5RcpFIjPADu6/3w4fMAvZs1mjs0VjxQLkgG3LFCDTAlfr3bzuvb6efvR7qa5DQ8i6SpPrjOuKW2zFl66rIkTWOxm9hctZ0U9qNltRLZL/0T7GkvDPKC6W2QzQpF0TOLKR0slsSL8/scX6busSKakgZ2B/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761585314; c=relaxed/simple;
	bh=n10NlR5AQZVuyebRk7B2SUL8HffpvVGuK0dPunXc6Is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a4ipLsXMhqvSy5JmoqkOq2dhzoWB1Tb07afs28kBbm8ieG4gx5i97agNe0snIXH4lMwxRjfTB9PiZYicfKJRHQHjS98xIuXiNV2Dej0v+HeP3LR8nt1jK083nVBJGxIfv4ftJOlHKtzSEVVUT5eE2rft/K59sZikQ6Brg8icphY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HqZr+eK4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HqZr+eK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911EAC19424
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 17:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761585311;
	bh=n10NlR5AQZVuyebRk7B2SUL8HffpvVGuK0dPunXc6Is=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=HqZr+eK4r0DzyGqvmeYi5mqxzyyqHWBykNMpoMfE03X5z6pt5O8eOzMRYd9U8ZUQh
	 eYITan5jDOYW+kPveVqXTdkK4/68+CF7oh5DF96MzpETlIk0uh4aLwwmhsahp6rIJn
	 hb9MZzElerUW3qdZGtZinkVPXmRKFFox7+oXIB2S4M/pqJ4Ql57IqzMoKRgUaT6FkK
	 jOYZyLvn00EyjpiJgUwyHOibmTJxoa1uwMGwn7D4dhkQA2/m62ejGggHXJUpSlXPII
	 kuefpXpMvSLts30670r1p/D5DybsVniH/C5X0jaqa2xC7Rx2pLw3QgoPR/rDlC8ft3
	 9Jha6fJS1+a+A==
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-430ce2c7581so21427995ab.0
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 10:15:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgWOFqsRiXZW1e5N1T9O1EqD3mCaXRdy0shk4juLoL3GurYY7SbQt4NBx3RWT4l6vCi8hXVsH/VoLj3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YykApAOLA3OfZWFtuELrE7Zu3jbnHwRLelIFDnNcWzehDmP9z+9
	yrQGbZekDMBqNXwaJonKxTlt1KT508WjMKaOA1pWixoE5hwia3w+I7U7lW6ITQID2uIfsf7J7w0
	vWplKTEtWqdMpwM6hyKs/1ve7jbOloDI=
X-Google-Smtp-Source: AGHT+IHX7Cu0cAsXytC3RTDyLGsbQ6D3nuir1yy3lnzLJPUDYwnFPuEpRZmXHsx20REcyJQHIoGh74zShF/YlLRFw2s=
X-Received: by 2002:a05:6e02:1686:b0:430:a4ba:d098 with SMTP id
 e9e14a558f8ab-4320f6e72b5mr13684325ab.14.1761585309545; Mon, 27 Oct 2025
 10:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-14-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-14-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 01:14:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v654iKx+2_GrFAJYF0VGXSd=ssxE6UYpN3jSAspEC9t3LQ@mail.gmail.com>
X-Gm-Features: AWmQ_bldcoQqUG3m9k_m37cYhHNBmzCyQWdekxIPdWuxn4IqUUTfMQc9GRDtYCo
Message-ID: <CAGb2v654iKx+2_GrFAJYF0VGXSd=ssxE6UYpN3jSAspEC9t3LQ@mail.gmail.com>
Subject: Re: [PATCH 13/30] drm/sun4i: de2/de3: Move plane type determination
 to mixer
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
> Plane type determination logic inside layer init functions doesn't allow
> index register to be repurposed to plane sequence, which it almost is.
>
> So move out the logic to mixer, which allows furter rework for DE33

                                               ^ further

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
