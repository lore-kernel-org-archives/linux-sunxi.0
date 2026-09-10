Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAD0396D13;
	Thu, 10 Sep 2026 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032898; cv=none; b=OoIhZ1CiJxZsg9mhpH9yJAf+WFKdp3Tf0lGr3h8rJI8rmeoRqm+FJPJ9IMHxb/GM2uiFu8vdzWiCsZqkvdZmNLO5AA1xM7QeitogHRAfLBJ2NVky1g2HHdaWwqVpmCRzTBs6JPt6qrP+9f9g9164+WskTs0HUiKPF+QG7vfztY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032898; c=relaxed/simple;
	bh=jTnUjcazQGxN7YyVuB+HY8VyHyC3cX22vFIMW/lUYvo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WSjwsCOqYyJmciJ3rnpCI6JS6dLucVDb5sGFgDG/Wg+3iKAj6uL32cXyQKysrpxXIIkJtwToimeYcMmn0KFWLKKeXEZ6x6phU2UmGT0C5XdNZgtn4P4NVMcGeJoka12lAbVVFw0e6FBgJPmdgvfCulXvbOTCnAkIbbP/b1ipIxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLpIIb5m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLpIIb5m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DBF41F000FF;
	Thu, 10 Sep 2026 09:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789032896;
	bh=jTnUjcazQGxN7YyVuB+HY8VyHyC3cX22vFIMW/lUYvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VLpIIb5mGiXlYL35DjbYfVFTOjm7aB4KV7ErpPPd8AqlN4ovbUa/LhaQWy3Tsaj3Q
	 7B0KMdN6I+GLvbP/SW8Rips51819d13YY3TCPM6IHHDgqzRXTZX30/BmtQADav4hb5
	 F+OfCTyCY5uFJU0zgEDAGnnkXJP3/mbFqIUlCySI9GwM2BdlN1cJ4PTamQAg/cu19H
	 YrYQNyKz/s/VpVjwwgAyX2Q7EfoWa3wBQzFmt7AaI4NtLIRuIUsda1QhFqs3phssSh
	 msxX14914t1KcYGgyXi6izqWkwqe7ykKhnhQ82/4vLBlm89epXQgBqsBjgH9J4OKSw
	 bb3dBNf6hLIng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/5] mfd: axp20x: Constify axp313 and axp717 cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: lee@kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-axp318-regulator-v7-1-de720ceb9bac@baylibre.com>
References: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
 <20260910-axp318-regulator-v7-1-de720ceb9bac@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 09:34:55 +0000
Message-Id: <20260910093456.1DBF41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

> mfd_cells array should generally be const and there does not seem to be
> anything against it for the axp313 and axp717.
>=20
> Constify the mfd_cells array for the axp313 and axp717 to be consistent
> with the other supported chips
>=20
> Acked-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-axp318-reg=
ulator-v7-0-de720ceb9bac@baylibre.com?part=3D1

