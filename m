Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06456177
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Jul 2021 07:31:49 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6A99E5C005F;
	Fri, 16 Jul 2021 03:31:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 16 Jul 2021 03:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=9
	q7nhrRhL96am75SGaSvOxEEm6JigHfcUYmu7xTlFV8=; b=jrQzRcir9ZP1z5EDU
	QduO1jKVBdynDvmqXQm7rRAAP7/SMSBMA9l3/64vFWiiSdzb2B/XgvchEBsDvA7m
	ONeBCQEgYOMEr2USlLtiEaZ2AUkikXRkrJR0bwVaOm2KmDHSzDjaqJSgDzOqfZeC
	WNbnEbpITNJw7G18jmLAy0hokzSz7t7oCSHhcIlIxPQMYpXO5kCJD2vCsCNBL4J0
	m391NSYs20yFO0ROXb7dVPOLoHHBIZiuFAXPzB440DKP9avLHq919/vExeHRKitZ
	4y9EGfmxrxQEpjMEyx9Iu4Hky0ChrC2yWOOzmtkZuSy4hkEahDYP06Ik9drvooV9
	Ql3nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=9q7nhrRhL96am75SGaSvOxEEm6JigHfcUYmu7xTlF
	V8=; b=MukbA9/qx+NaEa7CTyYCI9IXfsI0mds3znhfWZOLQ627I6rvfd1NRO3Ds
	JcwepO6pv/PJt4OGJwQfHzO+JDacb7UMKxMAFn7NUtVwiBqyrcmrjMVEaBQAbOhV
	wpiTMD6tfk1GBZTdxTQxYFqE67hi8l+4q3x2DhYuKeRMBFlwi/UETSJkVIPWezex
	PZ8Kt6kdXd/9TboGu6OUJGRJVEoZylb+sGc5N/cpSQlCXRUX0ZPMFXr7ZIq8Fkqq
	k9DUeYM3Ar0cazMV0RVlybrf3EHdK5AG6nV8nI9+77l/87T7jvMb32qeju7Niv+y
	s/KRuKhfrZ4B11D9ljagXqwFYdlPg==
X-ME-Sender: <xms:4zXxYI591YjJ6as-P0zxliNF6sA1GhfnhkJBvKMomNmOhR6iVfXPFw>
    <xme:4zXxYJ4lkjyDgi0zWGnOLm_AyCCZ6GHQbxreLQKJqXOb69neqWqE9elna2pa4R_37
    FqeeS4lebCbojA2FxQ>
X-ME-Received: <xmr:4zXxYHdQDsF_q-ThqfcdFZjWj3puptZ3Bj5XGlUJuPRsc5bTSk8SmBMPFGEbpHr1_6VulYbQU3OUZH9JCgVM-Ff6merF64mbBD0u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvgdduudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
    gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4zXxYNKY-rOhvpGVNL0GNZhYtVWwI_OeNVIb-d1t5kceSEtXfOjYkg>
    <xmx:4zXxYMKB2wCyIA14IPs7wQ9AspuXR5mlTap7-8m3KCcPRn_2wz6vCg>
    <xmx:4zXxYOwnye-tmyjMRPvWsYY8kH6M9TizUCg01Lcm-5hI4QL9IbwX1A>
    <xmx:5DXxYGgs6Xes9EohJJFP5RG5Saim9YIk7yAZeLyDM2LgsqknfwvX9A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Jul 2021 03:31:47 -0400 (EDT)
Date: Fri, 16 Jul 2021 09:31:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: David Stevens <stevensd@chromium.org>
Cc: linux-sunxi@lists.linux.dev, iommu@lists.linux-foundation.org
Subject: Re: [PATCH] iommu/sun50i: fix protection flag check
Message-ID: <20210716073146.3qskhbwzr427g5xe@gilmour>
References: <20210716042431.3195155-1-stevensd@google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210716042431.3195155-1-stevensd@google.com>

On Fri, Jul 16, 2021 at 01:24:31PM +0900, David Stevens wrote:
> From: David Stevens <stevensd@chromium.org>
>=20
> Fix RW protection check when making a pte, so that it properly checks
> that both R and W flags are set, instead of either R or W.
>=20
> Signed-off-by: David Stevens <stevensd@chromium.org>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime
