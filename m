Received: from d218-7.smtp-out.eu-west-2.amazonses.com (d218-7.smtp-out.eu-west-2.amazonses.com [23.249.218.7])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564DD3FD142
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jun 2026 21:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.249.218.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780520848; cv=none; b=Zrxx3xiuC5quOPV1t1c6DWr72HX2+Kejv0MFBpShIDQRTbdDQkqDWkL3VnmhZ2WjuN6KKD0im5/lVWn8YeM33hmKzbs2ANqmkgSsTWQhLyQ5wFoNUlIHC4IzIhJ7QAf9YX+926JtePQVxhMo0ReR2GlG6fs9djSe5e48iOjEV5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780520848; c=relaxed/simple;
	bh=isSWLwY4zDO68T/kGdvYNWm1DFcYaY4DMfMS76PAPiQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+ULgAFM43worD0cODXuL18YNsBb99U00YN2rkZgcB+W86s/aSAsy5pXk+XKSfOdww4JHpky3u0SPuROpUUwMoKVYljMxUnW1E4/lbY40HlZPJK5Z2EzrIEsjJ/xqywQsmcSzzSs0Bfuj+DioseYmV55HoYicqLCjNX0puDLPHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=electricworry.net; spf=pass smtp.mailfrom=mail.electricworry.net; dkim=pass (2048-bit key) header.d=electricworry.net header.i=@electricworry.net header.b=I1thPwe3; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=JlJyQZOc; arc=none smtp.client-ip=23.249.218.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=electricworry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.electricworry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=electricworry.net header.i=@electricworry.net header.b="I1thPwe3";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="JlJyQZOc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=xxcsvipqs5hvfd7f74n2i5bueyncqkjk; d=electricworry.net;
	t=1780520845;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
	bh=isSWLwY4zDO68T/kGdvYNWm1DFcYaY4DMfMS76PAPiQ=;
	b=I1thPwe3H49JuzZ0vjh08FnQDEsMp0hlA9fRSLJw7wf5stiJNsvwqrsmin3ejhYY
	V9Ck6gcRA/rBuPYK+iY6emmpFm8HPe3FCQ+v9Iq9P95kTc6o+TIJN5cCThmtPNlfJdC
	2G+9jx/CC0ZD7ZfDRIPDq4yDhPr/dVj0F0R1TYd9AFp79uJu08KmW2O+Af64c/R8JF6
	sxnVAGEYz/P/7zhMd+Nnl8lfYsRCyu3x4gJzANyW2AEs3lkg60gcxr93cJeNq4QbYTg
	i1LR+7FuQadPZ+QpHKXJQkTPcgJQE06tUP4OhHTTK1CiLpZMMx9XCSzbHAI64RJ0fOi
	VQwQ5lqScg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=smjs5bczbyxi6u2ua6eveuxqal7joyry; d=amazonses.com; t=1780520845;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
	bh=isSWLwY4zDO68T/kGdvYNWm1DFcYaY4DMfMS76PAPiQ=;
	b=JlJyQZOcE4778ku/x/0hvCBsSBb8huHWM38ztg8bf3AxscYvG0xrCnwI9qdUHE46
	1MoGmsgM2UXTPQzD3gSiBWnrwHyuK5sTCHAbjJFDEalKoyANszvpZl2hpF1fbqNXpz/
	yEweZbxMyvRE6ZSYyjqXLbRalyzyg+QFekprDHhA=
Date: Wed, 3 Jun 2026 21:07:25 +0000
From: Bob McChesney <bob@electricworry.net>
To: linux-sunxi@lists.linux.dev
Subject: Re: H616: dw-hdmi and HDMI_FC_INVIDCONF_HDCP_KEEPOUT_ACTIVE
Message-ID: <010b019e8f50015d-bbf52d3d-3faa-4634-956c-b4aa7a8a5ac2-000000@eu-west-2.amazonses.com>
Mail-Followup-To: linux-sunxi@lists.linux.dev
References: <010b019e7d8a5d77-66007852-7f5f-4bff-be1d-6058f6ae98bb-000000@eu-west-2.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010b019e7d8a5d77-66007852-7f5f-4bff-be1d-6058f6ae98bb-000000@eu-west-2.amazonses.com>
Feedback-ID: ::1.eu-west-2.gfFyncE+PRqcG/qebM3Lg+wfopUKzk5aGDEiDVENH+o=:AmazonSES
X-SES-Outgoing: 2026.06.03-23.249.218.7

On Sun, May 31, 2026 at 10:18:00AM +0000, Bob McChesney wrote:
> Since support for HDCP is not indicated via EDID but via communicating
> with other addresses over E-DDC, I presume that by activating this
> feature the HDMI IP is discovering HDCP features over I2C and enabling
> HDCP. Unfortunately I do not have an HDMI Analyser and I do not have an
> I2C sniffer (though I am waiting on a Raspberry Pi Pico arriving so that
> I can sniff the I2C traffic).

I got an I2C sniffer working and there was no real difference between
HDCP_KEEPOUT being Active or Inactive in terms of messaging; the only
messages I could see in either case were DDC (addr 0xA0/A1). This
contrasts to my Blu-ray player which additionally had SCDC (0xA8/A9) and
HDCP (0x74/75). The only differences I saw were an additional STOP being
seen in the Inactive case, and this appeared just before the display
finally appeared (after 14 seconds), and in the Inactive case the EDID
was read 4 times but only 3 times in the Active case.

So I remain mystified about why this flag makes a difference. I may need
to invest in a STIX HDMI Analyzer to learn a bit more.

Regards,
Bob
