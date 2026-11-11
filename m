Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359458;
	b=Q52rl+rsVXcL35PcN+f/RLgm6NFDTgZrqKhLUhZLRxxn/BWgNKWgijRUPuGgjtSwLrGK
	 9ckMKSnJBYX1PrHOjMgALHtohS8PLQqw7jXamy+u+46IsPgbCHBFUNNKfybok7Q0jB5wZ
	 T1vI/NXnEfqDXFYSWmYaTJyPkHTllLLjzxHO0qvZXEMI+/1qW5jm6FWYnGtiiG9FnH3XO
	 3miHSs3rPfP2upZ5sK6HbrqVdCESbCeVAIk8v/VGzIiZ0dDKToC82W9kkt9g+1gRHTr/+
	 F6dIo7ScG9dLJ7Pv94i9qjSKWL16zylWxJh8EmORidojYmLHFx90oLgi0vmazdNW7Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359458;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zN+ejUQk0ec18gmVY1DqDsW/U6uRuakgC45V1VMF/co=;
	b=c6LcIeHL9Lur+Z38/m9hlDwa+X0DHAH/fxWJFdfT3XGZJAir0HpiY7ewTPGNQY/z57Th
	 J6gFfagRkutBJNGNXv5zKTI2AcVQGhop54oTvt776y8y6uPrDkxK7i6uigoSN7ElF+6l5
	 iGJnxbY6WIGNPqYQC5KPG5fN5Rm6Cb0bCwh2uRhU3fVgTJsgbssUpSJvv4tpe8ILQD0H9
	 LO61nDU6FH6Qh3E3HRnkbeBlz1CS3b1VPgtYCwClpgNWGuycN8paT8KSQxmN+bR7C59ky
	 d6v4MtqzSyETBQsrEXgH923rDY+cvSl1/zJB95ke6kHNJDFr0/kzUoC+CL0ad/x0qlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RriZMLCB;
	arc=none smtp.remote-ip=91.218.175.62
Received: from mta0.migadu.com (out-62.mta0.migadu.com [91.218.175.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990AB606A31C
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Nov 2026 01:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 990AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RriZMLCB
X-Envelope-To: linux-sunxi@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=kV+W4EAXqlsZrd4CYUnY6FiLL+b4WpOHdN1Ui4mtJW0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794359455; v=1; x=1794964255;
 b=RriZMLCBCrR1xpuUn/rvD5HSXx6eBq38Koorbey2SekUmYli6MY2+El4FmYjopRuh49zpfkW
 uYJyqsNdVmqZbdgSbfsLXpEqgesJR/kPvpHOA4RfTVLMXjRO3MHpofev5wTQzBaCjxgecMMxiFN
 pKc86m8Uwxt14oyjNtnhbwFE=
X-Envelope-To: linux-sunxi@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 2546647a1e1f66cc;
	Wed, 11 Nov 2026 01:10:55 +0000
X-Mizu-Trace-ID: 2546647a1e1f66cc
X-Migadu-Flow: FLOW_OUT
From: Alvin Sun <alvin.sun@linux.dev>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Samuel Holland <samuel@sholland.org>,
 Yixun Lan <dlan@gentoo.org>,
 linux-sunxi@lists.linux.dev
Subject: Re: [TF-A / sunxi] Allwinner A733 (sun60iw2) TF-A Support & Validation on Orange Pi 4 Pro
Date: Wed, 11 Nov 2026 09:10:47 +0800
Message-ID: <20261111091047.a733-fw.alvin@linux.dev>
In-Reply-To: <556cd32394062960a3ea4af0011155cfa83ae91f.camel@d-silva.org>
References: <c8d7c508075e081219a0ed9ec8650aebade205db.camel@d-silva.org>
 <whzyZ-3mTjSNFzcz-TbNtw@gmail.com>
 <556cd32394062960a3ea4af0011155cfa83ae91f.camel@d-silva.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Alastair,

We have an open-source firmware stack for A733 - EDK2 (UEFI) plus TF-A
BL31 - and our Cubie A7A boards boot from it:

  https://github.com/alvinsun039/arm-trusted-firmware   (branch a733-bl31)
  https://github.com/alvinsun039/edk2-a733               (branch main)

Which part of the upstream work would be most useful for us to take on?

Regards,
Alvin Sun
