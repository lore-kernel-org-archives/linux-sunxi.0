Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575693;
	b=OgwJzPOuTT10VkW60gCkBA/NdEJrEMvemf0YrIz6qe0J/uyFzXc3b8QyUyitBvcinPkB
	 7hXnMY1lr5g11WDnZr9ZGhVfgjpcb5R+T9rhtJTWmHotvI4EYyGvBswBFekTA96qUmX0p
	 QeFGXHcPV6qGQKKWeGIUEOzMos1aUyhMvptZ7GgWgWRGmB15PzBjGavLQ6CBLvxCP3PEE
	 H8GXfMyToVcl8fPM1kr8myG7BXisjZ+dvc3N9aYe0AZMOKZKOrBMM3aZ38QMW6DzMLKOv
	 L9Cbj8lUJ0SGqgWos9MqrUANW71sSHx/AsH+l9GqtITIBGfojAjFt03RY795+8KFgTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575693;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=48KTX7AOk3CwsQ9KAtrOhGtQw23p2+Fmh0gxH55n1D8=;
	b=nuYlFs+eRBM4SlyLjee8EzbivA7+MA+s2rzl1UUHERpvQI+CJUIYHbgSvE8ZijelxTQZ
	 AxdXsRhQGiAIq3dDMsJTZRclxZAuxQeFcxJXQtuS19BUihZFokbkvdGQfTm25DG15jSoO
	 6EWhArdMrLgVyqcM6avKKME/wNa91EhcDfkNMxCmD0zc2IJGWQZCt9PSyJQRycnBGWiFc
	 ThQWVLVP/MTze6jCQluwJxUG29I6wtWxXYnYqXpPXntytHzIKMSvOHLvBbrZAqtnxoGyu
	 deibDSZ3kge3PkpRsQVxmBN9cbGxWZ412J0pvvSWcHGCXAwFR1xdz46wUwbujzlE9hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="MYGyZTa/";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A9760A2601
	for <linux-sunxi@lists.linux.dev>; Sun,  1 Nov 2026 23:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A9760A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MYGyZTa/
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D75FD27DC;
	Sun,  1 Nov 2026 15:28:01 -0800 (PST)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7C6F3F673;
	Sun,  1 Nov 2026 15:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793575685; bh=D556Mg6DU91sCjI4OWrht3raBRx6hYTUVI7DCziiSsg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MYGyZTa/ghHRuWyaJ/bQ5O1mw7QLq1QeHoqW+TtUxq3ms0NLREi01IfuXgSRAT6M5
	 A05Qrwen4ygSaWMQ542mAvAndN+pJGCLfqWkf9DSfgeHeONIuPOVR/l+TpCiksQTkQ
	 cYhge2kGeWJzEeGIvp7lFr+T+EUrfGWfYC4EerJU=
Date: Mon, 2 Nov 2026 00:27:55 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: trini@konsulko.com, ilias.apalodimas@linaro.org,
 u-boot@lists.u-boot-project.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: dram: only probe DRAM inside the addressable
 range
Message-ID: <20261102002755.59df587e@ryzen.lan>
In-Reply-To: <20261026173235.95831-1-jernej.skrabec@gmail.com>
References: <20261026173235.95831-1-jernej.skrabec@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 18:32:35 +0100
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

> The non-power-of-2 size check probes the memory cell at 3/4 of the
> detected size. On SoCs whose DRAM window is smaller than the detected
> size, like H6 with 4 GiB chips and a 3 GiB window, that address lies
> outside the window and the access hangs the SPL. Such boards cannot be
> odd-sized anyway, since the usable size is capped to the window later,
> so only run the check when the probed address is addressable.

Many thanks for the heads up, and the fix!
I can confirm that it's indeed a problem, and that the change fixes it:
tested on a 3GB Eachlink H6 Mini box.
I added one line to the comment above, to give some clue about the
reason for that added line (beyond just the commit message).

> Fixes: c47b63673736 ("sunxi: dram: detect non-power-of-2 sized DRAM chips")

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Queued for 2027.01.

Cheers,
Andre

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  arch/arm/mach-sunxi/dram_dw_helpers.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-sunxi/dram_dw_helpers.c b/arch/arm/mach-sunxi/dram_dw_helpers.c
> index d2af2d57fded..ae13dd154536 100644
> --- a/arch/arm/mach-sunxi/dram_dw_helpers.c
> +++ b/arch/arm/mach-sunxi/dram_dw_helpers.c
> @@ -155,7 +155,8 @@ unsigned long mctl_calc_size(const struct dram_config *config)
>  	 * or 3GB. They are detected as the larger power-of-2 (2GB and 4GB),
>  	 * so test the last quarter for being able to store values.
>  	 */
> -	if (!mctl_check_memory(CFG_SYS_SDRAM_BASE + size / 4 * 3)) {
> +	if (size / 4 * 3 < CONFIG_SUNXI_DRAM_MAX_SIZE &&
> +	    !mctl_check_memory(CFG_SYS_SDRAM_BASE + size / 4 * 3)) {
>  		if (mctl_check_memory(CFG_SYS_SDRAM_BASE + size / 4 * 3 - 64)) {
>  			size = (size / 4) * 3;
>  			debug("capping memory at %ld MB\n", size >> 20);

