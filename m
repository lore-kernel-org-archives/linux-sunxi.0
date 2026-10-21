Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605521;
	b=o6ryQXNzfI0n762OxygDcPn1lo3LCcptKbytTVzizVEflpd09BAY+3Mpwvg3eEt/ylNw
	 lbxvj63J0wqevsBvDrHLEWi6jU/tsB3vIxKlXwrPvKmqf1vOh7o4r3HhOaX+0J4Lgl+nr
	 0HBAv5LZfHZl5o8G1ZQShu2yCOqANac3Qja33sZl1AHnRMTDRDO2tQ+UlLyC0TZrFXhTb
	 AQMtTp7/4l68CqmF0pSlyLj+AnRID+gxk0EzdjcnxhMwyZmsMKhxZaZF+H39v0GwIQIE3
	 4GKhMoaaBQExENbcg5EK0Nd68EZ/7y2uwnv1zY7em2jv/Uv2CVQkJLotu4darkqP3Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ha1K352wfyqdFbF8DNVmHU8vhoz9syKvY98S4jY+g6Y=;
	b=Yw7aABsreNRXr6kt979j+JTQ8cFCg87erd3eE/iPiE6s8+mv/aJ4WCklJMBqPpMg05+4
	 8LoWN8AXuZ8hgZa48mjD9iFjkWfdxNByWIkXzEecnxNk+H4EkZIhLFOSJOn2RzHERghD5
	 47AXHo2ozPavJrUb0ffoTYZ4dEhpB5SFTf+FEajqe+ZDtZr3ztsSoCt1CeKQOH87HUnqI
	 fZ/4ke1yKmOLwERPENK4wPfjkdit1L2+YxjkWywJYw2Jep0o0QdNlm8atOhBm54TfXgRy
	 XbJBFI9U8hwQemdYE8y0R0E6vikeKxei+Sst1miwiNeXi/Bvuulq3eZdfEhd6cbngpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KY2k9zfH;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98724606A31A
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 17:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98724606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KY2k9zfH
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eac319a6c2so910339e0c.0
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792605519; x=1793210319; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ha1K352wfyqdFbF8DNVmHU8vhoz9syKvY98S4jY+g6Y=;
        b=KY2k9zfHOxoDjhk/f72w+AgcPwS+UBdPCJPkH7TaUuSsn53R9ouejG82DVJvjvmMCa
         TSwETtoFwbmhA+uyI6+KChc319dAUAs4eXkBUitdNBjkhDvw/H9klGoVYgCXck8A6dK1
         E9GSX6q5KmUIGuh/0ofyrlgwvA/fPYPTzUZv7BBN20OlUD2lRYrPDXwraiUtCDM6lCSa
         DQoCHvfYkUhP+awTieSrA9ZqEN+VF/AQ5PNRRqXEwUVVhjd8MtWyt6EtcHZT/Ky0BtCc
         vptqBlqX4O1TFKX5smJdR6tZCyA7izVy+JWzvYdU0s41qa3eXx54RZ4JCnKUiQGe+afT
         bqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605519; x=1793210319;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ha1K352wfyqdFbF8DNVmHU8vhoz9syKvY98S4jY+g6Y=;
        b=csEXO4ATBg8+kVEIcO7CkeQ9EkEPqSWURZBtvK/lsoRiB/4p7Ix9U96+uvHlMe0PO/
         QwLLahXOdVV1ISy2Pg+Z+LAXFS7dSyX3QtiesRrp9A/NCs8q+XWc5ypk5SkqHh4HLCYV
         B/rbQ/Rx2D8o4565xEIcBQ38+er06XRfDz7PZkQVVzlzyPBjfe4tmabGQsUaOpWMToSU
         FojIs56cFHJlK7MrdLxgscZNQgHm5Ml7qYV6ZK47OpAw6uB5rfgKppuJPCCO0F3dHNil
         NjThhVxC7WSS9spFNZc0dS5XsIn5obxuxeQOuuOxLlGzj4u9EBeFTNboYaiTPMSn3L3O
         QVpA==
X-Forwarded-Encrypted: i=1; AKwUvBwvxDTQXKrDG3olFnqrmdL3agOUE71EhwCMLnbc9wnHgt3tCU+JuFXC+J2e/tYpcu2Y8MG37hcPZsnAyw==@lists.linux.dev
X-Gm-Message-State: AFq9FYI2AqZFu8uX/Wo/OZG8w3WwCMq7GA3KNyXD+Pxi3C/+NJmPutSR
	QyIABqeAsq3rmTkI7rdF/mXcwGO20QYLe5khj2fDPEqCOozdqN2krRFe
X-Gm-Gg: AYBFou12pPrlDkpKXEOSP0hv81aHJLXZEThvUpE6xUQFombeDUgErtXV0kswhLc7aUR
	nq9XrTtPD3Ol7GtEKl7bzIccmjEjI6fM5Ybuxeh2z+eR0HalYs00BsiKfpi93abupqiN24Q565/
	TpWUz8TINKe6dkJxXPxXA97SamR0VlrmRWHdt7CalKesPl78Pl1GaUWID7S/BzDryEgPNuqB9Ds
	fJ7BvoyQjLtcKJ6E13pQrcIRahwvT2v8LJDUqk3bSmxnrLX74Wq1UkIpnrROeO2Mv1aLUc9eX1V
	qsOdkH6vZwIyPnfeQ3kg39JpkppS6T+wBu1uBocjwgrLzxU8MsK+HnnDPqrDee/fkRaNFJtbinu
	/967iL8wlcFeYOYblh60tPy5QcoNkoutqTd77jSBNsBFLDv2Qj2Q37nCmpzrINCXfDaeuW2tW5l
	nzy97EnwQorU1eJmMr5mL0lMuF+/uYjiIT74EdKlgM6NfBL2NJLVuHcrTdLfjIfsVQBR7/QFuKR
	rTZ9yItGwwUDHaovgZjRBIcqTCuWEc/apZJj6b4q86fMIf6DoQe0ODhPJnxEiCBVxQNFsUNZAkg
	q18uqljik/XZ2btsnYI86yoxHn+G6yoSgwsNapMfDcYEgsSRjKhwmcHA8FdT6TtUpyMk1FRXmUF
	tO3jF8IF2AA==
X-Received: by 2002:a05:6102:508f:b0:7c3:872c:8be6 with SMTP id ada2fe7eead31-7cc9271966dmr1231907137.25.1792605519613;
        Wed, 21 Oct 2026 10:58:39 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae9788c68sm4090944e0c.5.2026.10.21.10.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:58:39 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	ilpo.jarvinen@linux.intel.com,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: serial: snps-dw-apb-uart: Add Allwinner A733
Date: Wed, 21 Oct 2026 14:58:22 -0300
Message-ID: <20261021175822.318717-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <414bbb7a-1018-41ac-a580-cd41708c6a78@arm.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <09f3a181436e6f19317224e583c2fdaa787797d7.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <414bbb7a-1018-41ac-a580-cd41708c6a78@arm.com>
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

Hi Andre,

On Wed, 21 Oct 2026, Andre Przywara wrote:

> So if I understand correctly, this compatible is really there for the
> clock gating issue, right? As the DLF part is now somewhat correctly
> auto-detected?

Yes, the compatible is only for the clock issue (SKIP_SET_RATE). The
false DLF detection is handled generically by patch 2.

> Can you share what your termios test looks like? Because I assume this
> affects more Allwinner SoCs (the DLF change definitely does).
> Then we should add more compatible strings here. If there is a simple
> test, I am happy to run this on a bunch of boards, to give you a list.

I reduced the termios test to a small standalone reproducer and retested
it on the A733. While the serial console is continuously transmitting,
this program toggles CLOCAL and restores it:

    #include <fcntl.h>
    #include <stdio.h>
    #include <termios.h>
    #include <unistd.h>

    int main(int argc, char **argv)
    {
            const char *dev = argc > 1 ? argv[1] : "/dev/console";
            struct termios orig, changed;
            int fd = open(dev, O_RDWR | O_NOCTTY | O_NONBLOCK);

            if (fd < 0 || tcgetattr(fd, &orig)) {
                    perror(dev);
                    return 1;
            }

            changed = orig;
            changed.c_cflag ^= CLOCAL;

            if (tcsetattr(fd, TCSANOW, &changed) ||
                tcsetattr(fd, TCSANOW, &orig)) {
                    perror("tcsetattr");
                    return 1;
            }

            return 0;
    }

I compile it with:

    cc -O2 -o clocal-toggle clocal-toggle.c

and run 300 iterations from a shell on the serial console, keeping the
console busy:

    dmesg -n 1
    (while :; do seq 1 1000; done) &
    gen=$!
    i=0
    while [ "$i" -lt 300 ]; do
            ./clocal-toggle || break
            i=$((i + 1))
    done
    kill $gen

CLOCAL doesn't change the framing, so the output should stay a clean
1..1000 sequence. A bad run shows garbage characters and missing lines.

On the A733 I ran this test five times without SKIP_SET_RATE and all
five runs were corrupted. With the A733 compatible selecting
SKIP_SET_RATE, all five were clean.

Running the same test on your other Allwinner boards would be very
useful. I also have a small script that checks the capture, if that
helps.

Thanks,
Vinicius
