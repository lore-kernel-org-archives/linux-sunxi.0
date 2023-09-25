Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F1CCA5D
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Sep 2023 07:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C379C433CA;
	Mon, 25 Sep 2023 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695628038;
	bh=ai0ndMiQTr1EgM1mkMSEcaZf/fv6l0ZrtbSfG0oo/dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ae/o+N14zek9vY+lt5L+r231MVLkY11Kfh0zo33ZxOyod/sJna5kxFd1taJzqjmvL
	 AApBTF/+uHBFSHD3ZHc8zuoRJc8iC7RFDv/wBLWevcgz6847H7+InmCCDazqM/s8hj
	 HHnfJGPwjrVrt9g7CeO+dUZr4s0zoR1LU2UbNNl3zOs9YSgBmjnB6rjfPk5eHaUDxJ
	 Pvr4r8tLwk6+zjfBWeUIkr7cYOtj9JLRcPG8poEHH3DEWdikSHnL4sBUaJoLPHgwcW
	 6c/3EoMXerwD9ZzvQ4Yu4+rkQjBUIebQ6MPAxEhlStWRx28v7p6Sx5cvFnKposvKHz
	 KhJ5C7u2A2BeQ==
Date: Mon, 25 Sep 2023 09:47:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: wens@csie.org, airlied@gmail.com, daniel@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] drm/sun4i: dw-hdmi: Split driver registration
Message-ID: <rvqcfohw4i4y7amod3a5e4u4tkorqmaekvikyqg3fibvy53dsd@be4lk4ae35hq>
References: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
 <20230924192604.3262187-6-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eocwwgd3x2awngfp"
Content-Disposition: inline
In-Reply-To: <20230924192604.3262187-6-jernej.skrabec@gmail.com>


--eocwwgd3x2awngfp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 24, 2023 at 09:26:02PM +0200, Jernej Skrabec wrote:
> There is no reason to register two drivers in same place. Using macro
> lowers amount of boilerplate code.

There's one actually: you can't have several module_init functions in
the some module, and both files are compiled into the same module.

Maxime

--eocwwgd3x2awngfp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZRE6+AAKCRDj7w1vZxhR
xU0jAQCEM+c6zLXLlT5j6S8sGRwxntW1Bcyw5my0XKT7j4XSbgD+JtiNnKl2B/qf
51/BgWAYSfhdkCz0N7MFiMbhOasGLAY=
=zuMY
-----END PGP SIGNATURE-----

--eocwwgd3x2awngfp--
