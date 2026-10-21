Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590345;
	b=YmBktsypeW6B4HFFU6CgcXKm93b02vQH5wthYWIl2+jZnJ8oZan63h38af0Yn+OinVsa
	 3xRmy8/edX5JKRtptIXbXljNsZWp0rJSNpi64ZjyAe44jrWKMVgxFA5nrucBo6o/kgDfg
	 w3du+TkhxwtH/TCXn1R/HF2WKz1DnNu/KJUb1RxO9tPklnlxBNlVPqdudwKYdyR78UB2Q
	 8pXOGEU8cbRVcaHeGaYGN/g7mh3ak4YHpdEhQxz8JjrgKWMACi/4OJZQkuyHrth7OKVEk
	 L5FfcRVpltyCDWqM4N1vDA54+bdVkYubQHMqebeTXZsIcEzhK2uOGC8MBcZhSHTjbJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590345;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=om8w7QXSdYKu02tw65tJ99U3eL+Sg+cuLsqMm6GZ54U=;
	b=hNR4hAshigK9XYBNaoSGfClJWbewmd47w3ec2Pd8yuh0aQWOitVWR00w3m9IIc2BQnQm
	 6J3H1MC+GoNxfQXEnYnrbv7W8d8P1gBjo9vA6uOD4Sit+A7OjeYX76gxdMSNPZW6htIGi
	 w2EWX+Hjw1YvsoC3r+giKJ78SmgjrfTjYDvvMI/kZ9FXoUz9+mgWkN+FgPfdcbIADWWXg
	 Xe4/YRHwtD0YR5mlOXQzeK8izwdiHgurFB6WX7t/J0rWKuA5QhPVCppLAyOU6gUn5E7j0
	 YZGGhHe0V7wLnl1TMzq7ZkUjSTLEx4hoiNaziqtrHFhx7bbvlKXvl+LsZ5zt6Mv4Twg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PE4kwjVN;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DFF606A319
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 13:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37DFF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PE4kwjVN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792590344; x=1824126344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lUjLPWWlN6l1+ey7iJlAqTyXZpN23Ksa49kPyHEPupc=;
  b=PE4kwjVNIPcdSktzGAKB86k/AHTGY8fJU+zJUhnISVefVl5XvK1GO1jA
   aAhsN0hlG0bTiw6aAXr5oe41i4x9cMQ31+68XGq4FvjxdHJBu3EohcC7g
   cOaW0tlAJyYeRjX8K9t+7d45z9Ohbi4Ltvk3FW+jBnrjOWaWc8M3rQHh7
   1DZMdWNkDR7zWtN8zeItaSOw9Sg01q3JYJWrWSFwrqN74nduEeWQoW+W5
   pg0+E5/M5e1aki8bV4Hom5F1U6DE15IK7pxK+Zy+zlUokI9p0hMp1gs35
   qhKQEG4X/ZrOKH4ClLPYwG5or21ATb3whbhafeM1PtQ7BeJdPewAYQQob
   w==;
X-CSE-ConnectionGUID: z7L/F4G4RU+9OWM1fZirXA==
X-CSE-MsgGUID: Y+TDTKI0R92kLxK+ay5N+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1346849"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1346849"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 06:45:35 -0700
X-CSE-ConnectionGUID: +SSgAPUWSeqSj+QSQsE4OQ==
X-CSE-MsgGUID: Q5rODW1QRJ+XPjGyXAxLGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3036317"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 06:45:31 -0700
Date: Wed, 21 Oct 2026 16:45:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: linux-serial@vger.kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook
 when DLF is present
Message-ID: <atjB-BnXclL3FcUm@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
 <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
 <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com>
 <athe0QikG2mzCAtd@ashevche-desk.local>
 <20261021100049.16504-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021100049.16504-1-vinicius.eduardo.pedrosa@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 21, 2026 at 07:00:49AM -0300, Vinicius Pedrosa wrote:
> On Wed, 21 Oct 2026, Andy Shevchenko wrote:
> 
> > Right, but have you read my second question in the above paragraph?
> 
> Sorry, I missed the second part of your question.
> 
> If I understand you correctly, since 8250_dw.c already has the BUSY-safe
> set_divisor, you're suggesting that it should have the matching
> get_divisor as well, instead of pairing it with the dwlib getter.

Exactly!

> The dwlib getter would stay for the other users of dw8250_setup_port(),
> like 8250_lpss. Is that the structure you had in mind?

8250_lpss doesn't redefine either of the _get/_set_divisor, so it won't be
affected. But I think that 8250_lpss actually lacks of busy support that's
why it uses simpler version of all this. Maybe we can refactor that (in
the future?) so that we will have dwlib to provide the IDLE version of them
for all and depending on the existence of busy functionality degrade to
the same as just current DFL helpers.

Can you check that approach?

Ah, dw8250_idle_*() are already BUSY-functionality aware. So, what we need
is to provide dw8250_idlej_*() callbacks via struct dw8250_port_data and
make current 8250_dw::dw8250_set_divisor() to be part of dwlib.

Patch 1 (dwlib): Add callback definitions for dw8250_idle_*() to struct dw8250_port_data
Patch 2 (dw): Assign new callbacks and use them in dw8250_set_divisor()
Patch 3 (lpss): Introduce stubs and assign new callbacks to them
Patch 4 (dwlib): Use dw8250_idle_*() in dw8250_set_divisor()
Patch 5 (dw): Kill now duplicate code pieces

(Some of the patches might be combined, but I think the above split is not bad.)

Would it work?

-- 
With Best Regards,
Andy Shevchenko


