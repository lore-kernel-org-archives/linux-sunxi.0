Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182798;
	b=rP+ANolsSUt0wQ1zGyGdS3bqC/2+XDVT6iejAITB/XWTvFleml8m437wdb+Pcdl2Fa4d
	 e67nVJmgzEvkcaBDbiT9Se1y9uMrQ/btxhak/v8sD1ar6LxPnPMrgrEEno2VZBKTjgxtD
	 0WT1ZEyqc5yFNHdsQzFG9nOezAd7wDzltz4l7ahHnk58jqRftgka290/IZtLxRYwO3Q9o
	 HLage4xNBKs+2+Svi6nnyxS9yx3TuyIMobHaNy3MhPjnTtbx4M5jIN73ewBtAGlz2FCZ6
	 ToBjIJ4a6VKXTREz+USPrqfG/cXqvvMWtYmrgAoEV7iterYf/eTHt5uaJbfYXbkHwfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182798;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID;
	bh=2ZWSUt1aDOTrXezGlhmPihRNANH2MwmPepdlpbcHlbQ=;
	b=aBA6dmadCT5N4ozbFWXHRrWmRNwofYGgQvwTLnt8Mz75grz5BZHFuvshdVw36tJLQogk
	 RdtwYN3w0Mg6dK5SJviaO3O+beGonRw/S6aCoW4EmSlCrkGuxynaQzR9u9ssZrVkhxTnG
	 24t6oGqdUmqmjV8DT+UbS5yDTz7BxQfM9U87SIHTEfrSQHR5H0ta2GBwKWcBdSYFG1Oee
	 gxOB9v9Ny2+VtE5t/852tk1/Hcm/zdKcFF2QyQW8HZBb9Sugi2lMcZj9ESQxMpKrJK2UZ
	 e1N1R6Z+SpqRqq1AtN20QnrtTj0YD69JnIYs+Mw7CLuUeCjEez3gBTDGTBI3NSEhrmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o42jNoY+;
	arc=none smtp.remote-ip=91.218.175.26
Received: from mta0.migadu.com (out-26.mta0.migadu.com [91.218.175.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D6B606A320
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 13:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D6B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=o42jNoY+
X-Envelope-To: linux-sunxi@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=2ZWSUt1aDOTrXezGlhmPihRNANH2MwmPepdlpbcHlbQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795182796; v=1; x=1795787596;
 b=o42jNoY+OJzY7Okdro7sTTZnoCWDk5Ss/COzxJWteQG5MLNpRvIu7iLvsIHRwI5giLs8tumX
 3GPG2N9G2t/yl4TntY8nosMF1g9QcrGZYNWZ7oj111Wk8hrnT+zLJ8OOSUnMb7ziEsdNNFQTB38
 GLsemb4bPKSD2+Q8bl5/1MWk=
X-Envelope-To: linux-sunxi@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d5ff0575c4d70f2c;
	Fri, 20 Nov 2026 13:53:16 +0000
X-Mizu-Trace-ID: d5ff0575c4d70f2c
X-Migadu-Flow: FLOW_OUT
From: Alvin Sun <alvin.sun@linux.dev>
To: linux-sunxi@lists.linux.dev
Cc: "Alastair D'Silva" <alastair@d-silva.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Yixun Lan <dlan@gentoo.org>
Subject: Re: [TF-A / sunxi] Allwinner A733 (sun60iw2) TF-A Support & Validation on Orange Pi 4 Pro
In-Reply-To: <3a4378bfcbc13ff0d5959117f23b4dc6f45258c7.camel@d-silva.org>
References: <c8d7c508075e081219a0ed9ec8650aebade205db.camel@d-silva.org>
          <whzyZ-3mTjSNFzcz-TbNtw@gmail.com>
          <556cd32394062960a3ea4af0011155cfa83ae91f.camel@d-silva.org>
          <20261111091047.a733-fw.alvin@linux.dev>
          <3a4378bfcbc13ff0d5959117f23b4dc6f45258c7.camel@d-silva.org>
Date: Fri, 20 Nov 2026 13:53:16 +0000
Message-ID: <d29caad6a3d59785.1795182796@smtp.migadu.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

On Wed, 2026-11-11 at 13:14 +1100, Alastair D'Silva wrote:
> Hi Alvin,
>
> Thanks! I'm just about to submit UBoot patches for SPL (replacing vendor boot0)
> and the PMU that trains memory.
>
> I only have LPDDR5 support in it at the moment, if you have other Cubie boards on
> hand that support LPDDR4, adding LPDDR4 support to that would be of huge value
> (I don't have the relevant hardware to test).
>
I only have the Cubie A7A (8GB LPDDR5) on hand; an Orange Pi Zero3W
(1GB LPDDR4) is on the way and I can validate your LPDDR4 training
path on it once it lands.

Best regards,
Alvin
>
> Cheers,
>
> --
> Alastair D'Silva
