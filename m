Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778769;
	b=tyGYby+3gof0Y4EDgCotuIEVpbzVTyZpir7HbDawCAcO3vuZNLRWhSrU47ka9On9D4bv
	 9lnhL+1n9SbtVJUcfwpo/twTkJDY67yPENxuWfJVYrvLgqpvP407PVjjEgkNClubdolMj
	 MMi7FURAFBU58Ztm9brqTqVGyZyKK9BX9hXQ+5CM+aUDB+65i9257TgY0xtUXCJ/hbmS5
	 zSFYz4QOpf3IOTig9i+z+jiR23W3hZNS1/pwptZ2pycXzcY/zsE4GME1xEesyibHq/0nK
	 p/BGEecvwi8no75wnD9y4x39F+g8XYtn38C2XxXNhv3bNEfYLjY+UO4GX4kYrDc2M4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778769;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Spam;
	bh=v9sb71Kl68g0Rq0utYtKxsaYTR3AAMwhH149FGZ6d3U=;
	b=KJxX1w8jvcOdr5fK15wrv75Yxn/LKWTtlXi6VLbkh+RWd3qJKut4zmQ+qI3NIUljMb35
	 76zgIFTU9G4hqgYeXBnUdBYgJ+Brpmhxl3TsK+dE87WMAnsCLyceZQ9C9ESbd9C7jSKPh
	 NheEv5b6jTzVdZ4EwP1yIWCASIPv/3Ex9MrCsPONIN+GFdQlmfdJtiCQabBttSyVYtPPT
	 AmMwI6Vm9plOhzTPEE5DqjXUJz3n+8BAdZbB1ofo8rJySqnxb5n9pvfZ8+n369Y4F4Dqs
	 EQZ4klDMeAZVS0cULz25QtfIcj3G8+tUZYdbFyrTo6rgJzWTN4VypeBl7XFNhrL4ulA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=y6Yn2lrp;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6175E606A682
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 11:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6175E606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=y6Yn2lrp
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id F36D14C998;
	Fri, 27 Nov 2026 22:26:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795778765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v9sb71Kl68g0Rq0utYtKxsaYTR3AAMwhH149FGZ6d3U=;
	b=y6Yn2lrpWIKV24oU547aMM7jPunxwwPNFSRtfAgVrxMbdGxDzOZjVwhDtSkdY/155biu8j
	8db6YvQyOkKiKaRQ347dgjVxCG+s5JnjkYJrIVdw3ZloukR8FTVMOC+vSWZ808ryunUcZ4
	nPltYgt+JK5tMvjt+tHmidBKa7p4oFj8pT6X7PJJKHN3lvP+ICr+qu+DmYBf0R4HPyp9t/
	glYdmNxkfXdUDDRhQr1e1Or8VPnYqXJqq5bdIx+QVkImob+zZg0WK8tzcKCe0jcVw8rsyE
	pU5cw5Zp+h5H4S+0w2YdYMUvR071So0sXc8har9B720ZpMpwS00B6ACTEuaaBg==
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH v2 4/4] serial: 8250_dw: Add Allwinner A733 UART
Date: Fri, 27 Nov 2026 22:26:04 +1100
Message-ID: <20261127112604.2585595-1-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <a3505ad8e74a08faa270881f0efbfe0d0d82d6e0.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <a3505ad8e74a08faa270881f0efbfe0d0d82d6e0.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes

On Mon, 19 Oct 2026 17:06:13 -0300, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> wrote:
> On the A733, dw8250_set_termios() stops the UART clock around
> clk_set_rate() on every termios change that reaches the driver. If TX is
> active at that moment, the character being shifted out is corrupted.
>
> No baud rate change is required to trigger the problem. Toggling only
> CLOCAL or CSTOPB 300 times during continuous console output corrupted
> bytes in every run without the quirk and in none with it.
>
> Use the existing SKIP_SET_RATE quirk, as the JH7100 and SG2044 UARTs do.
>
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index 4c86aaf9c121..718ec44135e4 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -906,6 +906,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
>  
>  static const struct of_device_id dw8250_of_match[] = {
>  	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
> +	{ .compatible = "allwinner,sun60i-a733-uart", .data = &dw8250_skip_set_rate_data },
>  	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
>  	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
>  	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

Tested on Xunlong OrangePi 4 Pro (Allwinner A733):
- UART0 (2500000.serial, ttyS0, base_baud = 1500000) boots to shell and
  echoes interactive console input at 115200 baud.

Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org> # OrangePi 4 Pro
